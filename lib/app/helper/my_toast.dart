import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyToast{
  static void info(String msg) {
    Fluttertoast.showToast(msg: msg, backgroundColor: Colors.cyan);
  }

  void success(String msg) {
    Fluttertoast.showToast(msg: msg, backgroundColor: Colors.cyan);
  }

  static void warning(String msg) {
    Fluttertoast.showToast(msg: msg, backgroundColor: Colors.amber);
  }

  static void error(String msg) {
    Fluttertoast.showToast(msg: msg, backgroundColor: Colors.redAccent);
  }
}