import 'package:flutter/material.dart';
import 'package:mySignupApp/HomePage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;

  String name, email, mobile, collegeName, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Sign Up",
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Image(
                  image: AssetImage("images/logo.png"),
                  width: 100.0,
                  height: 100.0,
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter Name';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    onSaved: (input) => name = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter Email';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    onSaved: (input) => email = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter Phone Number';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                    ),
                    onSaved: (input) => mobile = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.school),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter College Name';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'College Name',
                    ),
                    onSaved: (input) => collegeName = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.vpn_key),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter Password';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    onSaved: (input) => password = input,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                ),
                ButtonTheme(
                  height: 40.0,
                  minWidth: 200.0,
                  child: RaisedButton(
                    onPressed: _sendToNextScreen,
                    color: Colors.blueAccent,
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                ButtonTheme(
                  height: 40.0,
                  minWidth: 200.0,
                  child: RaisedButton(
                    onPressed: _resetForm,
                    color: Colors.redAccent,
                    child: Text(
                      "Reset",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _sendToNextScreen() {
    if (_key.currentState.validate()) {
      // saves to global key
      _key.currentState.save();

      // send to next screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            name: name,
            mobile: mobile,
            email: email,
            collegeName: collegeName,
            password: password,
          ),
        ),
      );
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }

  _resetForm() {
    // setState(() {
    //   this.name = "";
    //   this.email = "";
    //   this.mobile = "";
    //   this.collegeName = "";
    // });
    _key.currentState.reset();
  }

}
