
import 'package:contactapp/Contactmodal.dart';
import 'package:contactapp/Screen1.dart';
import 'package:contactapp/Screen2.dart';
import 'package:contactapp/Screen3.dart';
import 'package:contactapp/Splashscreen.dart';
import 'package:contactapp/Stepmodal.dart';

import 'package:contactapp/Thememodal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';




void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => ContactListProvider(),),
        ChangeNotifierProvider(create: (context) => step(),),
        ChangeNotifierProvider(create: (context) => ThemeModal(),)
      ],
        child:const MyApp(),)
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeNotifier, child) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: themeNotifier .isDark?ThemeData.dark():ThemeData.light(),
        home:Splashscreen(),
        routes: {
          '/addContact': (context) => AddContactScreen(),
          '/editContact': (context) => EditContactScreen(index: 0,),
        },
      );
    },);
  }
}







