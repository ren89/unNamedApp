import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
    prefixIcon: Icon(
      icon,
      color: const Color.fromRGBO(50, 62, 72, 1.0),
    ),
    hintText: hintText,
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  );
}

MaterialButton longButtons(String title, dynamic func) {
  Color color = Colors.blue;
  Color textColor = Colors.white;
  return MaterialButton(
    onPressed: func,
    textColor: textColor,
    color: color,
    height: 40.0,
    minWidth: 600,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: SizedBox(
      width: double.infinity,
      child: Text(title, textAlign: TextAlign.center),
    ),
  );
}

SnackBar snackbar(String title, String message) {
  return SnackBar(
    content: Column(
      children: [Text(title), Text(message)],
    ),
    duration: const Duration(seconds: 10),
  );
}

Flushbar customFlushBar(String message, Duration duration) {
  return Flushbar(
    title: 'Mismatch password',
    message: 'Please enter valid confirm password',
    duration: const Duration(seconds: 10),
  );
}
