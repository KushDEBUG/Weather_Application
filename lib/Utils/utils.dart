import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastmessage(String? message) {
    Fluttertoast.showToast(
      msg: message!,
      fontSize: 20,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }
}
//toastmessage use for description or message of any error