import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_erp/services/menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> students = [];
  List<dynamic> teachers = [];

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final jsonData = await rootBundle.loadString('assets/data/users.json');
    final data = json.decode(jsonData);

    setState(() {
      students = data['students'];
      teachers = data['teachers'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('ERP Dashboard'),
      ), drawer: Menu(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(19),
          child: Text("Welcome user", style: TextStyle(fontSize: 24),),
        )
      ),
    );
  }
}