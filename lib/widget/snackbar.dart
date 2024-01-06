import 'package:flutter/material.dart';

class MyMessageHandler {
  /// this is the design of custom snackbar
  static void showSnackbar(var _scaffoldMessangerKey, String message) {
    _scaffoldMessangerKey.currentState!.hideCurrentSnackBar();
    _scaffoldMessangerKey.currentState!.showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 800),
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: Colors.yellowAccent.shade700,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}
