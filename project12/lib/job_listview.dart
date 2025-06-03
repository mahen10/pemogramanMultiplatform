import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'job.dart';

class JobsListView extends StatelessWidget {
  const JobsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Job>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Job>? data = snapshot.data;
          return _jobsListView(data);
        } else if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

Future<List<Job>> _fetchJobs() async {
  var uri = Uri.parse('https://jsonfakery.com/jobs');
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((job) => Job.fromJson(job)).toList();
  } else {
    throw Exception('Failed to load jobs from API');
  }
}

ListView _jobsListView(data) {
  return ListView.builder(
    itemCount: data.length,
    itemBuilder: (context, index) {
      return _tile(context, data[index].title, data[index].company, Icons.work);
    },
  );
}

ListTile _tile(
  BuildContext context,
  String title,
  String subtitle,
  IconData icon,
) => ListTile(
  title: Text(
    title,
    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
  ),
  subtitle: Text(subtitle),
  leading: Icon(icon, color: Colors.blue[500]),
  onTap: () {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 1),
      content: Text("Anda memilih $title!"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  },
);
