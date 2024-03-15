import 'package:contactapp/Thememodal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SettingsState();
  }
}

class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final d = MediaQuery.of(context).platformBrightness;
    return Consumer(
      builder: (context, ThemeModal themeNotifier, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff68907A),
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: themeNotifier.isDark ? Colors.white : Colors.black,
              ),
            ),
            title: Text(
              'Settings',
              style: TextStyle(
                  color: themeNotifier.isDark ? Colors.white : Colors.black,
                  fontSize: 20),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (themeNotifier.isDark) {
                      } else {
                        themeNotifier.isDark = true;
                      }
                    });
                  },
                  child: Container(
                    height: 60,
                    width: 380,
                    color: Colors.grey,
                    child: Center(
                        child: Text(
                      "Dark Mode",
                      style: TextStyle(
                          color: themeNotifier.isDark
                              ? Colors.white
                              : Colors.black,
                          fontSize: 20),
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (themeNotifier.isDark) {
                        themeNotifier.isDark = false;
                      }
                    });
                  },
                  child: Container(
                    height: 60,
                    width: 380,
                    color: Colors.grey,
                    child: Center(
                        child: Text(
                      "Light Mode",
                      style: TextStyle(
                          color: themeNotifier.isDark
                              ? Colors.white
                              : Colors.black,
                          fontSize: 20),
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (d == Brightness.light) {
                        themeNotifier.isDark = false;
                      } else {
                        themeNotifier.isDark = true;
                      }
                    });
                  },
                  child: Container(
                    height: 60,
                    width: 380,
                    color: Colors.grey,
                    child: Center(
                        child: Text(
                      "Device Mode",
                      style: TextStyle(
                          color: themeNotifier.isDark
                              ? Colors.white
                              : Colors.black,
                          fontSize: 20),
                    )),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
