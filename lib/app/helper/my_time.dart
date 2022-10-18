import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
extension DateTimeFormat on DateTime{
  String format([String pattern = "yyyy-MM-dd"]){
    initializeDateFormatting();
    final DateFormat formatter = DateFormat(pattern,"id");
    return formatter.format(this);
  }
}


class MyTime {
  final DateTime mDateTime;

  MyTime(this.mDateTime){
    initializeDateFormatting();
  }



  static MyTime parse(String date) {
    DateTime dt = DateTime.parse(date);
    return MyTime(dt);
  }

  String format([String pattern = "yyyy-MM-dd"]) {
    final DateFormat formatter = DateFormat(pattern,"id");
    return formatter.format(mDateTime);
  }
}
