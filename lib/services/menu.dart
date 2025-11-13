import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key, });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
       padding: EdgeInsets.zero,
        children: [
            DrawerHeader(
               decoration: BoxDecoration(color: Colors.blue.shade800),
               child: Center(
                  child: Center(
                    child: Text(
                        "KVS\n"
                        "(Kendriya Vidyalaya Sangathan)", style: TextStyle(
                        color: Colors.white,)
                    ),
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
