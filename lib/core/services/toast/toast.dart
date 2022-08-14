import 'package:flutter/material.dart';

class Toast {
  final BuildContext context;
  Toast(this.context);
  void show(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
