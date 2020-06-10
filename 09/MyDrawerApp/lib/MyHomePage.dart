import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Drawer App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Shouvik'),
              accountEmail: Text('shouvik@bajpayee.com'),
              currentAccountPicture: CircleAvatar(
                // backgroundColor: Colors.orange,
                backgroundImage: AssetImage("images/me.jpg"),
                // child: Container(
                //   child: Image(
                //     image: AssetImage("images/me.jpg"),
                //     height: 80.0,
                //     width: 60.0,
                //     fit: BoxFit.cover,
                //   ),
                // ),
              ),
            ),
            ListTile(
              title: Text("Home"),
              trailing: Icon(Icons.home),
              onTap: () => Navigator.of(context).pushNamed("/home"),
            ),
            ListTile(
              title: Text("Category"),
              trailing: Icon(Icons.category),
              onTap: () => Navigator.of(context).pushNamed("/category"),
            ),
            ListTile(
              title: Text("Profile"),
              trailing: Icon(Icons.portrait),
              onTap: () => Navigator.of(context).pushNamed("/profile"),
            ),
            // Divider(),
            ListTile(
              title: Text("Signup"),
              trailing: Icon(Icons.home),
              onTap: () => Navigator.of(context).pushNamed("/signup"),
            ),
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Home Page",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.cloud_circle),
        onPressed: () {},
      ),
    );
  }
}
