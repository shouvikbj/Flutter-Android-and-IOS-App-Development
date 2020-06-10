import 'package:flutter/material.dart';
import 'screens/HomePage.dart';

void main() => runApp(MyApp());

// First put google json file in android and ios
// use gradle in android plugin
// do same for ios
// yaml for flutter

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        // "/SigninPage": (BuildContext context) => SigninPage(),
        // "/SignupPage": (BuildContext context) => SignupPage(),
      },
    );
  }
}
