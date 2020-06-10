import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name, email, mobile, collegeName, password;

  HomePage({
    Key key,
    @required this.name,
    this.email,
    this.mobile,
    this.collegeName,
    this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Student's Info"),
      ),
      body: Form(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(50.0),
              ),
              Image(
                image: AssetImage("images/logo.png"),
                width: 100.0,
                height: 100.0,
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text(name),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text(email),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(mobile),
              ),
              ListTile(
                leading: Icon(Icons.school),
                title: Text(collegeName),
              ),
              ListTile(
                leading: Icon(Icons.vpn_key),
                title: Text(collegeName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
