import 'package:flutter/material.dart';
import 'package:pizzaria/test.dart';
import 'package:pizzaria/view/dashboard.dart';
import 'package:pizzaria/view/splash.dart';
import 'view/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
