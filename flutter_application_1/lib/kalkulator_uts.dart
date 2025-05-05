import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(KalkulatorApp());
}

class KalkulatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator UTS',
      debugShowCheckedModeBanner: false,
      home: KalkulatorUTS(),
    );
  }
}

class KalkulatorUTS extends StatefulWidget {
  @override
  _KalkulatorUTSState createState() => _KalkulatorUTSState();
}

class _KalkulatorUTSState extends State<KalkulatorUTS> {
  final TextEditingController nilai1Controller = TextEditingController();
  final TextEditingController nilai2Controller = TextEditingController();
  String hasil = '';

  void hitung(String operator) {
    double nilai1 = double.tryParse(nilai1Controller.text) ?? 0;
    double nilai2 = double.tryParse(nilai2Controller.text) ?? 0;
    double res;

    switch (operator) {
      case '+':
        res = nilai1 + nilai2;
        break;
      case '-':
        res = nilai1 - nilai2;
        break;
      case '*':
        res = nilai1 * nilai2;
        break;
      case '/':
        res = nilai2 != 0 ? nilai1 / nilai2 : 0;
        break;
      case '%':
        res = nilai1 % nilai2;
        break;
      case '^':
        res = pow(nilai1, nilai2).toDouble();
        break;
      case '~/':
        res = pow(nilai1, 1 / (nilai2 != 0 ? nilai2 : 1)).toDouble();
        break;
      default:
        res = 0;
    }

    setState(() {
      hasil = 'Hasil : $nilai1 $operator $nilai2 = ${res.toStringAsFixed(0)}';
    });
  }

  Widget buildButton(String operator, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: SizedBox(
        height: 50,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            side: BorderSide(color: Colors.black),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          onPressed: () => hitung(operator),
          child: Text(
            operator,
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Kalkulator UTS',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Divider(thickness: 2),
              SizedBox(height: 10),
              Align(alignment: Alignment.centerLeft, child: Text("Nilai 1")),
              SizedBox(height: 4),
              TextField(
                controller: nilai1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
              SizedBox(height: 10),
              Align(alignment: Alignment.centerLeft, child: Text("Nilai 2")),
              SizedBox(height: 4),
              TextField(
                controller: nilai2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  buildButton('+'),
                  SizedBox(width: 8), // Space between buttons
                  buildButton('-'),
                  SizedBox(width: 8), // Space between buttons
                  buildButton('*'),
                  SizedBox(width: 8), // Space between buttons
                  buildButton('/'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  buildButton('%'),
                  SizedBox(width: 8), // Space between buttons
                  buildButton('^'),
                  SizedBox(width: 8), // Space between buttons
                  buildButton('~/', flex: 2), // Tombol lebar 2 kolom
                ],
              ),
              SizedBox(height: 20),
              Text(hasil, style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
