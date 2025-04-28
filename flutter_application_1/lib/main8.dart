import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EdgeInsets.all App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metode EdgeInsets.all'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            color: Colors.tealAccent,
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(3.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Button 1'),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(
                width: 5.0,
                color: Colors.red,
              ),
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Button 2'),
            ),
          ),
          Container(
            color: Colors.tealAccent,
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(3.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Button 3'),
            ),
          ),
        ],
      ),
    );
  }
}
