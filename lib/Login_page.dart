import 'package:flutter/material.dart';
import 'package:soft_solution_app/Register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login_page extends StatefulWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  TextEditingController pno = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Login',
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
                height: 160,
              ),
              GestureDetector(
                onTap: () async {},
                child: Container(
                  height: 40,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Center(
                      child: Text(
                    'Login',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )),
                ),
              ),
              SizedBox(
                height: 180,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You have not account !"),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Register",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
