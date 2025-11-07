import 'package:flutter/material.dart';
import 'package:school_erp/pages/navigation.dart';
import 'package:school_erp/pages/profile_page.dart';

class Menu extends StatelessWidget {
  const Menu({super.key, });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
       padding: EdgeInsets.zero,
        children: [
            DrawerHeader(
               decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/image/logo.jpg'), fit: BoxFit.cover)),
               child: Center(
                  child: Text(
                      "E.R.P", style: TextStyle(
                      color: Colors.white, fontSize: 32)
                  ),
                ),
            ),
               ListTile(
               leading: Icon(Icons.home, size: 32,),
               title: Text("Home", style: TextStyle(fontSize: 24),),
               onTap: (){
               },
          ),
          ListTile(
            leading: Text("👩‍🏫", style: TextStyle(fontSize: 24),),
            title: Text("Class Teacher", style: TextStyle(fontSize: 24),),
            onTap: (){
            },
          ),
          ListTile(
            leading: Icon(Icons.class_rounded, size: 32,),
            title: Text("Time Table", style: TextStyle(fontSize: 24),),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.description, size: 32,),
            title: Text("Exams", style: TextStyle(fontSize: 24),),
            onTap: (){
            },
          ),
          ListTile(
            leading: Icon(Icons.currency_rupee_outlined, size: 28),
            title: Text("Fees", style: TextStyle(fontSize: 24),),
            onTap: (){
            },
          ),
        ],
      ),
    );
  }
}
