import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogPref{
  static const Prefkey='pref_kry';
  setLogi(bool val)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setBool(Prefkey, val);
  }
  getLogi() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences.getBool(Prefkey);
  }
}
class Lpogin extends ChangeNotifier{
  bool _log=true;
  LogPref _preferances=LogPref();
  bool get log=>_log;
  Lpogin(){
    _log=false;
    _preferances=LogPref();
    getPreferances();
  }
  getPreferances() async{
    _log=await _preferances.getLogi();
    notifyListeners();
  }
  set log(bool val){
    _log=val;
    _preferances.setLogi(val);
    notifyListeners();
  }
}