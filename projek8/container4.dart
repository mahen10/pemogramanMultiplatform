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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Percobaan Menggunakan Widget'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 6.0,
      ),
      body: Container(
        child: const Center(
          child: Text(
            'RPL Polbeng',
            style: TextStyle(fontSize: 40.0, color: Colors.white),
          ),
        ),
        color: Colors.blue,
        width: 250,
        height: 100,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
      ),
    );
  }
}