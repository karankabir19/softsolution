import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soft_solution_app/Login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:soft_solution_app/Register_page.dart';
import 'package:soft_solution_app/otp_verification.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  static String verify = "";

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController pno = TextEditingController();
  TextEditingController email = TextEditingController();
  String? vid;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Register',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: 'First Name',
                    hintStyle: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: 'Last Name',
                    hintStyle: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: TextFormField(
                  controller: pno,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: 'Mobile No',
                    hintStyle: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: 'Email',
                    hintStyle: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance
                      .verifyPhoneNumber(
                    phoneNumber: '+91${pno.text}',
                    verificationCompleted: (PhoneAuthCredential credential) {
                      Navigator.pushNamed(context, '/login');
                    },
                    verificationFailed: (FirebaseAuthException e) async {
                      // await _auth.signInWithCredential(pno.text);
                    },
                    codeSent: (String verificationId, int? resendToken) {
                      setState(() {
                        vid = verificationId;
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OTPVerificationPage(vid),
                          ));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  )
                      .then((value) {
                    print("code sent");
                  });
                },
                child: Container(
                  height: 40,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Center(
                      child: Text(
                    'Register',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have'n account!"),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(Login_page());
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
