import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Percobaan Menggunakan Widget',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Controller untuk TextField
  TextEditingController _controller = TextEditingController();

  // Jangan lupa dispose controller untuk mencegah memory leak
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Percobaan Menggunakan Widget')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              onChanged: (String value) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: 'Inputkan nama anda',
                hintStyle: TextStyle(fontStyle: FontStyle.normal),
                labelText: 'Nama anda',
                icon: Icon(Icons.person_pin),
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text('Hallo apa kabar ${_controller.text}'),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 10),
            Text(_controller.text),
          ],
        ),
      ),
    );
  }
}
