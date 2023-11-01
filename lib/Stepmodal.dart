import 'package:contactapp/Stepper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class step extends ChangeNotifier{
  void getstep(){
    corrontstep+=1;
    notifyListeners();
  }
  void minstep(){
    corrontstep-=1;
    notifyListeners();
  }
  void  savedata () async{
    final prefs=await SharedPreferences.getInstance();
    prefs.getString("MyName");
    notifyListeners();

  }
}