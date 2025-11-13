import 'package:flutter/material.dart';
import 'package:school_erp/teacher/profile_page.dart';
import 'home_page.dart';


class TeacherNavigation extends StatefulWidget {
  const TeacherNavigation({Key? key}) : super(key: key);

  @override
  State<TeacherNavigation> createState() => _TeacherNavigationState();
}

class _TeacherNavigationState extends State<TeacherNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [HomePage(), ProfilePage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent
      ),
      child:
    Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outlined), activeIcon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
