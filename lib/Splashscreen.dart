import 'dart:async';

import 'package:contactapp/Screen1.dart';

import 'package:contactapp/Stepper.dart';
import 'package:contactapp/Thememodal.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Splashscreenstate();
  }
}
class Splashscreenstate extends State<Splashscreen>{
 static const String KEYLOGIN='login';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fun();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer(builder: (context, ThemeModal themeNotifiter, child) {
      return Scaffold(
        backgroundColor: themeNotifiter.isDark?Color(0xff23395D):
        Color(0xff68907A),      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.call,size: 50,color: Colors.white,),
            Text('Contact Diary App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),)
          ],
        ),
      ),
      );
    },);
  }
 void fun()async
 {
   var Prefs=await SharedPreferences.getInstance();
   var isloggedIn = Prefs.getBool(KEYLOGIN);

   Timer(Duration(seconds: 3), () {
     if(isloggedIn!=null)
     {
       if(isloggedIn)
       {
         Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>ContactListScreen()),);

       }
       else{
         Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>StepperW(),));
       }
     }
     else{
       Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>StepperW()),);
     }
   });



 }

 // void matric(bool z) async {
 //   bool k=false;
 //   final bool canAuthenticateWithBiometrics = await localAuth.canCheckBiometrics;
 //   final bool canAuthenticate =
 //       canAuthenticateWithBiometrics || await localAuth.isDeviceSupported();
 //   if (canAuthenticate) {
 //     if(k==true){
 //       await localAuth.authenticate(localizedReason: 'check');
 //     }
 //   }else{
 //     Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>ContactListScreen()),);
 //   }
 // }

}