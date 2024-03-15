import 'dart:async';
import 'package:contactapp/ContactListpage.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Splashscreenstate();
  }
}

class Splashscreenstate extends State<Splashscreen> {
  static const String KEYLOGIN = 'login';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fun();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xff68907A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.call,
              size: 50,
              color: Colors.white,
            ),
            Text(
              'Contact Diary App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  void fun() async {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ContactListScreen()),
      );
    });
  }
}
