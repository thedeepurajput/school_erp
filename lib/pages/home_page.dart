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

  final List<Map<String, dynamic>> menuItems = [
      {'icon': Icons.event_available, 'label': 'Attendance'},
      {'icon': Icons.class_, 'label': 'Class'},
      {'icon': Icons.book, 'label': 'Courses'},
      {'icon': Icons.currency_rupee, 'label': 'Fees'},
      {'icon': Icons.notifications, 'label': 'Notice'},
      // {'icon': Icons.bar_chart, 'label': 'Report'},
      {'icon': Icons.people, 'label': 'Student'},
      {'icon': Icons.person, 'label': 'Teacher'},
      {'icon': Icons.schedule, 'label': 'Time Table'},

  ];

  // List<dynamic> students = [];
  // List<dynamic> teachers = [];
  //
  // @override
  // void initState() {
  //   super.initState();
  //   loadUserData();
  // }
  //
  // Future<void> loadUserData() async {
  //   final jsonData = await rootBundle.loadString('assets/data/users.json');
  //   final data = json.decode(jsonData);
  //
  //   setState(() {
  //     students = data['students'];
  //     teachers = data['teachers'];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('ERP Dashboard'),
      ), drawer: Menu(),
      body:
        Padding(
          padding: const EdgeInsets.all(19),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome Deepu", style: TextStyle(fontSize: 32,),),
              SizedBox(height: 24,),
              Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15
                      ),
                      itemCount: menuItems.length,
                      itemBuilder: (context, Index){
                        return GestureDetector(
                          onTap: (){},
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.shade100,
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(menuItems[Index]['icon'], size: 32, color: Colors.blueGrey.shade800,),
                                  SizedBox(height: 1,),
                                  Text(
                                      menuItems[Index]['label']
                                  )
                                ],
                              ),
                            ),
                        );
                      }
                  )
              )
            ],
          ),
        )
    );
  }
}