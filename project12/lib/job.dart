class Job {
  final String id;
  final String title;
  final String company;
  final String description;

  Job({
    required this.id,
    required this.title,
    required this.company,
    required this.description,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      company: json['company'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
