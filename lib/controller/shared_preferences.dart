// import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> ResultList = [];
List<String> inputList = [];

class SP {
  Future<void> loadInputSPList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> loadedList = prefs.getStringList('myStringList') ?? [];
    inputList = loadedList;
  }

  Future<void> addInputSP(String newString) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    inputList.insert(0, newString);
    await prefs.setStringList('myStringList', inputList);
  }

  Future<void> loadResultSPList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> loadedList = prefs.getStringList('myinputList') ?? [];
    ResultList = loadedList;
  }

  Future<void> addResultSp(String newString) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ResultList.insert(0, newString);
    await prefs.setStringList('myinputList', ResultList);
  }
}
