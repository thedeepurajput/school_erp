import 'package:flutter/material.dart';
import 'package:school_erp/auth/student_auth.dart';
import 'package:school_erp/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: StudentAuth(),
    );
  }
}
