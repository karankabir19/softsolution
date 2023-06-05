import 'package:flutter/material.dart';
import 'package:soft_solution_app/User_page.dart';

class user_page extends StatefulWidget {
  const user_page({Key? key}) : super(key: key);

  @override
  State<user_page> createState() => _user_pageState();
}

class _user_pageState extends State<user_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Users",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              height: 80,
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: Karan Kabir',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    Text(
                      'Email : karankabir1907@gmail.com',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    Text(
                      'Mobile : 99132 47133',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
