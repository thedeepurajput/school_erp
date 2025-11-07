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
               leading: Icon(Icons.home),
               title: Text("Home"),
               onTap: (){

               },
          ),
          ListTile(
            leading: Icon(Icons.calendar_month),
            title: Text("Class Schedule"),
            onTap: (){},
          ),
          ListTile(
            leading: Text("👩‍🏫", style: TextStyle(fontSize: 20),),
            title: Text("Class Teacher"),
            onTap: (){
            },
          ),
        ],
      ),
    );
  }
}
