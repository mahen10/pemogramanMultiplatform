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
  bool _checkboxVal1 = false;
  bool _checkboxVal2 = false;
  bool _checkboxVal3 = false;
  bool _checkboxVal4 = false;
  List<String> list = [];
  String text = "";

  void showData() {
    text = "";
    for (int i = 0; i < list.length; i++) {
      text += '${list[i]}, ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Percobaan Menggunakan Widget')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const Text('Bahasa pemrograman yang dikuasai:'),
            CheckboxListTile(
              value: _checkboxVal1,
              title: const Text('Python'),
              activeColor: Colors.greenAccent,
              secondary: const Icon(Icons.language),
              onChanged: (bool? value) {
                setState(() {
                  _checkboxVal1 = value!;
                });
                if (_checkboxVal1 == true) {
                  list.add('Python');
                } else {
                  list.remove('Python');
                }
                showData();
              },
            ),
            CheckboxListTile(
              value: _checkboxVal2,
              title: const Text('Javascript'),
              activeColor: Colors.greenAccent,
              secondary: const Icon(Icons.language),
              onChanged: (bool? value) {
                setState(() {
                  _checkboxVal2 = value!;
                });
                if (_checkboxVal2 == true) {
                  list.add('Javascript');
                } else {
                  list.remove('Javascript');
                }
                showData();
              },
            ),
            CheckboxListTile(
              value: _checkboxVal3,
              title: const Text('PHP'),
              activeColor: Colors.greenAccent,
              secondary: const Icon(Icons.language),
              onChanged: (bool? value) {
                setState(() {
                  _checkboxVal3 = value!;
                });
                if (_checkboxVal3 == true) {
                  list.add('PHP');
                } else {
                  list.remove('PHP');
                }
                showData();
              },
            ),
            CheckboxListTile(
              value: _checkboxVal4,
              title: const Text('Java'),
              activeColor: Colors.greenAccent,
              secondary: const Icon(Icons.language),
              onChanged: (bool? value) {
                setState(() {
                  _checkboxVal4 = value!;
                });
                if (_checkboxVal4 == true) {
                  list.add('Java');
                } else {
                  list.remove('Java');
                }
                showData();
              },
            ),
            Text('Data: $text'),
          ],
        ),
      ),
    );
  }
}
