import 'package:contactapp/Contactmodal.dart';
import 'package:contactapp/AddContactPage.dart';
import 'package:contactapp/EditContactPage.dart';
import 'package:contactapp/Splashscreen.dart';
import 'package:contactapp/Thememodal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ContactListProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeModal(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ThemeModal themeNotifier, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
          home: Splashscreen(),
          routes: {
            '/addContact': (context) => AddContactScreen(),
            '/editContact': (context) => EditContactScreen(
                  index: 0,
                ),
          },
        );
      },
    );
  }
}
