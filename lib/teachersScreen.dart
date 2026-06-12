import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeachersScreen extends StatefulWidget {
  const TeachersScreen({super.key});

  @override
  State<TeachersScreen> createState() => _TeachersScreenState();
}

class _TeachersScreenState extends State<TeachersScreen> {
  String? selectedSubject;
  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
      prefixIcon: Icon(icon, color: _navy, size: 22),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.grey.shade200, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: _accent, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.redAccent, width: 2),
      ),
    );
  }
  static const Color _navy = Color(0xFF1A2B4A);
  static const Color _accent = Color(0xFF2E6FF3);
  static const Color _bg = Color(0xFFF4F6FB);
  final TextEditingController _notesController = TextEditingController();

  final List<String> subjects = [
    "professional english",
    "foundational mathematics",
    "digital electronics",
    "c programming",
    "c++ programming",
    "Java",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),

            const Text(
              "Add Subject Notes (PDF)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // 📌 Subject Dropdown
            DropdownButtonFormField<String>(
              value: selectedSubject,
              decoration: InputDecoration(
                labelText: "Select Subject",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: subjects.map((subject) {
                return DropdownMenuItem(
                  value: subject,
                  child: Text(subject),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedSubject = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // 📌 PDF Picker Button (UI only)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue),
                color: Colors.blue.shade50,
              ),
              child: const Row(
                children: [
                  Icon(Icons.picture_as_pdf, color: Colors.red),
                  SizedBox(width: 10),
                  Text("Choose PDF File"),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _notesController,
              keyboardType: TextInputType.phone,
              decoration:
              _inputDecoration('Add Notes', Icons.note),
              validator: (v) {
                if (v == null || v.isEmpty) return 'Notes is required';
                return null;
              },
            ),

            const SizedBox(height: 16),

            const SizedBox(height: 20),

            // 📌 Upload Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Notes uploaded successfully!"),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                    ),
                  );

                  // Future.delayed(const Duration(seconds: 2), () {
                  //   if (mounted) {
                  //     Navigator.pop(context);
                  //   }
                  // });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Upload Notes",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


