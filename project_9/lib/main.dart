import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Demo Form Validation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validateInput() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua data sudah tervalidasi!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(hintText: 'NIM'),
                keyboardType: TextInputType.text,
                validator: (value) => (value == null || value.isEmpty)
                    ? 'NIM tidak boleh kosong'
                    : null,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Nama'),
                keyboardType: TextInputType.text,
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Nama tidak boleh kosong'
                    : null,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Program Studi'),
                keyboardType: TextInputType.text,
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Program Studi tidak boleh kosong'
                    : null,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Semester'),
                keyboardType: TextInputType.number,
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Semester tidak boleh kosong'
                    : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: validateInput,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
