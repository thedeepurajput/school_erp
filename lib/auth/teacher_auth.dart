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

  final formkey = GlobalKey<FormState>();

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
        image: DecorationImage(image: AssetImage('assets/image/logo.jpg'),
          fit: BoxFit.cover,
          alignment: Alignment.center
        )
        ),
        child: Center(
          child:
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Container(
                  child: Card(
                    color: Colors.white.withOpacity(0.9),
                    // elevation: 9,
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Form(
                        key: formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Teacher Login", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                            SizedBox(height: 32,),
                            TextFormField(
                              controller: userName,
                              decoration: InputDecoration(
                                  labelText: 'UserName',
                                  hintText: 'Enter Your UserName',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  )
                              ),
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return 'UserName is Required';
                                } else if (value.length < 3){
                                  return 'Username must be at least 3 characters';
                                } return null;
                              },
                            ),
                            SizedBox(height: 16),
                            TextFormField(
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
                             ), validator: (value){
                              if (value == null || value.isEmpty){
                                return 'Password is Required';
                              } else if (value.length < 6) {
                                return 'Password must be at lease 6 characters';
                              } return null;
                            },
                             ),
                            SizedBox(height: 24,),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if(formkey.currentState!.validate()) {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(
                                              builder: (context) => Navigation()));
                                    }}, style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
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
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation, secondaryAnimation) => StudentAuth(),
                                          transitionDuration: Duration.zero,
                                          reverseTransitionDuration: Duration.zero,
                                        ),
                                      );
                                    }, style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
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
                                }, child: Text("Forgot Password", style: TextStyle(color: Colors.black),))
                              ],
                            )
                          ]
                        ),
                      ),
                    ),
                  )
              ),
            ),
          ),
        ),
      ),
    );
  }
}