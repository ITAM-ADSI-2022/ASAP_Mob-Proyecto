import 'package:flutter/material.dart';

Future<dynamic> goto(BuildContext context, Widget widget, [bool push = true]) {
  if (!push)
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );
  else
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => widget));
}

void showSnack(
    {required BuildContext context,
    required String text,
    int durationInSeconds = 1}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    duration: Duration(seconds: durationInSeconds),
  ));
}

bool isSameDay(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}

bool isToday(DateTime a) {
  return isSameDay(a, DateTime.now());
}
