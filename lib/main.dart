import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login.dart';

void main() {
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      title: '農業コネクト',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: LoginPage(),
    );
  }
}
