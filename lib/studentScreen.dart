import 'package:flutter/material.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  final List<Map<String, dynamic>> subjects = [
    {"name": "Professional English", "icon": Icons.menu_book},
    {"name": "Foundational Mathematics", "icon": Icons.calculate},
    {"name": "Digital Electronics", "icon": Icons.memory},
    {"name": "C Programming", "icon": Icons.code},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Dashboard"),
        backgroundColor: Colors.blue,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: subjectCard(
              subjects[index]["icon"],
              subjects[index]["name"],
            ),
          );
        },
      ),
    );
  }
}
Widget subjectCard(IconData icon, String title) {
  return Container(
    height: 75,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.blue.shade100),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6,
          offset: Offset(0, 3),
        ),
      ],
    ),

    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(icon, color: Colors.white),
        ),

        const SizedBox(width: 15),

        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

        const Spacer(),

        const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
      ],
    ),
  );
}
