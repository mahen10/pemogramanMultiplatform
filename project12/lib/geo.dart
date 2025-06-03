import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

const String apiKey = '08389efaba7b81325282fa92d1e67e2d'; 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WeatherPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String cityName = '';
  Map<String, dynamic>? weatherData;
  bool isLoading = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getLocationAndFetchWeather();
  }

  Future<void> _getLocationAndFetchWeather() async {
    setState(() {
      isLoading = true;
    });

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      await fetchWeatherByCoordinates(position.latitude, position.longitude);
    } catch (e) {
      // Jika gagal ambil lokasi, fallback ke kota Jakarta
      await fetchWeatherByCity('Bengkalis');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> fetchWeatherByCoordinates(double lat, double lon) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        weatherData = data;
        cityName = data['name'];
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<void> fetchWeatherByCity(String city) async {
  setState(() {
    isLoading = true;
  });

  final url =
      'https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$apiKey';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data['cod'] == 200 || data['cod'] == "200") {
      setState(() {
        weatherData = data;
        cityName = data['name'];
      });
    } else {
      setState(() {
        weatherData = null;
        cityName = '';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kota tidak ditemukan: ${data['message']}')),
      );
    }
  } else {
    setState(() {
      weatherData = null;
      cityName = '';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Gagal mengambil data cuaca')),
    );
  }

  setState(() {
    isLoading = false;
  });
}


  Widget weatherCard() {
    if (weatherData == null) return const SizedBox.shrink();

    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              cityName,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '${weatherData!['main']['temp'].toString()} °C',
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 10),
            Text(
              weatherData!['weather'][0]['description'],
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Humidity: ${weatherData!['main']['humidity']}%'),
                Text('Wind: ${weatherData!['wind']['speed']} m/s'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Cari Kota',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    FocusScope.of(context).unfocus(); // sembunyikan keyboard
                    fetchWeatherByCity(_controller.text);
                  },
                ),
                border: const OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                fetchWeatherByCity(value);
              },
            ),
          ),
          if (isLoading)
            const Expanded(child: Center(child: CircularProgressIndicator()))
          else
            Expanded(child: Center(child: weatherCard())),
        ],
      ),
    );
  }
}
