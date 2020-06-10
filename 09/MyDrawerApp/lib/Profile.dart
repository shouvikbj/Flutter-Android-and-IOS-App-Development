import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup Page"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "Profile Page",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 300.0,
              height: 300.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/me.jpg"),
                ),
              ),
            ),
            Text(
              "\nShouvik Bajpayee",
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
              ),
            ),
            Text(
              "\nshouvik@bajpayee.com",
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
