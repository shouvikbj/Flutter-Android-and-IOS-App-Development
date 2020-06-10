import 'package:MyDrawerApp/Category.dart';
import 'package:MyDrawerApp/MyHomePage.dart';
import 'package:MyDrawerApp/Signup.dart';
import 'package:MyDrawerApp/Profile.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My drawer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        "/home" : (BuildContext context) => MyHomePage(),
        "/category" : (BuildContext context) => Category(),
        "/signup" : (BuildContext context) => Signup(),
        "/profile" : (BuildContext context) => Profile(),
      },
    );
  }
}
