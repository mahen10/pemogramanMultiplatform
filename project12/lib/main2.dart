import 'package:flutter/material.dart';
import 'job_listview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Portal',
      home: Scaffold(
        appBar: AppBar(title: const Text('Job Portal')),
        body: const Center(child: JobsListView()),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
