import 'package:flutter/material.dart';
import 'package:school_erp/auth/student_auth.dart';
import 'package:school_erp/pages/home_page.dart';
import 'package:school_erp/pages/navigation.dart';

class TeacherAuth extends StatefulWidget {
  TeacherAuth({super.key});

  @override
  State<TeacherAuth> createState() => _TeacherAuthState();
}

class _TeacherAuthState extends State<TeacherAuth> {
  final TextEditingController userName = TextEditingController();

  final TextEditingController password = TextEditingController();

  bool obsecuredPassword = false;

  @override
  void dispose (){
      userName.dispose();
      password.dispose();
      super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage("https://as1.ftcdn.net/v2/jpg/02/76/64/42/1000_F_276644254_WLTRw8cuxEqEHx0grR1pzfduxYvu9EfW.jpg"),
          fit: BoxFit.cover,
          alignment: Alignment.center
        )
        ),
        child: Center(
          child:
          Padding(
            padding: EdgeInsets.all(24.0),
            child: Container(
                height: 450,
                width: double.infinity,
                child: Card(
                  elevation: 9,
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Teacher Login", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                        SizedBox(height: 32,),
                        TextField(
                          controller: userName,
                          decoration: InputDecoration(
                              labelText: 'UserName',
                              hintText: 'Enter Your UserName',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                              )
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                        controller: password,
                        obscureText: obsecuredPassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                        hintText: 'Enter Your Password',
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            obsecuredPassword = !obsecuredPassword;
                          });
                        }, 
                            icon: Icon(
                            obsecuredPassword
                                ? Icons.visibility_off
                                : Icons.visibility
                            )),
                              border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              ),
                         ),
                         ),
                        SizedBox(height: 24,),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Navigation()));
                            }, style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black12,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)
        
                              )
                          ),
                            child: Text('Login'),
                          ),
                        ),
                        SizedBox(height: 26),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> StudentAuth()));
                                }, style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black12,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)
        
                                  )
                              ),
                                child: Text('Student Login'),
                              ),
                            ),
                            Spacer(),
                            TextButton(onPressed: (){
                            }, child: Text("Forgot Password"))
                          ],
                        )
                      ]
                    ),
                  ),
                )
            ),
          ),
        ),
      ),
    );
  }
}