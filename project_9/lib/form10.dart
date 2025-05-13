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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
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
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  FocusNode namaFocusNode = FocusNode();
  final TextEditingController prodiController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController semesterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    prodiController.addListener(printValue);
  }

  @override
  void dispose() {
    namaFocusNode.dispose();
    prodiController.dispose();
    nimController.dispose();
    namaController.dispose();
    semesterController.dispose();
    super.dispose();
  }

  void printValue() {
    print('Teks pada field Program Studi: ${prodiController.text}');
  }

  void showData() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Data yang Dimasukkan'),
          content: Text(
              'NIM: ${nimController.text}\nNama: ${namaController.text}\nProgram Studi: ${prodiController.text}\nSemester: ${semesterController.text}'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void validateInput() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua data sudah tervalidasi!')),
      );
      showData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                controller: nimController,
                decoration: const InputDecoration(
                    hintText: 'NIM',
                    labelText: 'NIM',
                    icon: Icon(Icons.person_pin),
                    border: OutlineInputBorder()),
                keyboardType: TextInputType.text,
                validator: (value) => (value == null || value.isEmpty)
                    ? 'NIM tidak boleh kosong'
                    : null,
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: namaController,
                focusNode: namaFocusNode,
                decoration: const InputDecoration(
                    hintText: 'Nama',
                    labelText: 'Nama',
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder()),
                keyboardType: TextInputType.text,
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Nama tidak boleh kosong'
                    : null,
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: prodiController,
                decoration: const InputDecoration(
                    hintText: 'Program Studi',
                    labelText: 'Program Studi',
                    icon: Icon(Icons.dashboard),
                    border: OutlineInputBorder()),
                keyboardType: TextInputType.text,
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Program Studi tidak boleh kosong'
                    : null,
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: semesterController,
                decoration: const InputDecoration(
                    hintText: 'Semester',
                    labelText: 'Semester',
                    icon: Icon(Icons.format_list_numbered),
                    border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Semester tidak boleh kosong'
                    : null,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: validateInput,
                    child: const Text('Submit'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).requestFocus(namaFocusNode);
                    },
                    child: const Text('Fokus ke Nama'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
