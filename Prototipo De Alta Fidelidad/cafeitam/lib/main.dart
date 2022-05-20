import 'package:cafeitam/login.dart';
import 'package:flutter/material.dart';
import 'palette.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cafe ITAM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: generateMaterialColor(Palette.mainGreen),
      ),
      home: Login(),
    );
  }
}
