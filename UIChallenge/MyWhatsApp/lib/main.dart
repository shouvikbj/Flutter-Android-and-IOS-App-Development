import 'package:flutter/material.dart';
import 'screen/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      theme: ThemeData(
        primaryColor: new Color(0xff074E54),
        // accentColor: new Color(0xff25D366),
        accentColor: Colors.lightGreen,
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
          bodyText2: TextStyle(
            color: Colors.black,
          ),
          button: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        bottomAppBarColor: Colors.white,
      ),
      home: Home(),
    );
  }
}
