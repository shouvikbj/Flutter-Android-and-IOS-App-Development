import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyButton(),
  ));
}

class MyButton extends StatefulWidget {
  @override
  MyButtonState createState() {
    return MyButtonState();
  }
}

class MyButtonState extends State<MyButton> {
  int counter = 0;
  List<String> spanishNumbers = [
    "uno",
    "dos",
    "tres",
    "cuatro",
    "cinco",
    "seis",
    "seite",
    "ocho",
    "nueve",
    "dietz"
  ];
  List<String> numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
  String defaultText = "Spanish Numbers";
  String startNumber = "__";

  void displaySNumbers() {
    setState(() {
      // defaultText = spanishNumbers[counter];
      // counter++;
      if (counter == 9) {
        defaultText = spanishNumbers[counter];
        startNumber = numbers[counter];
        // counter = 0;
        counter++;
      } else if (counter == 10) {
        defaultText = "Start Over Again";
        startNumber = "__";
        counter = 0;
      } else {
        defaultText = spanishNumbers[counter];
        startNumber = numbers[counter];
        counter++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Stateful App.'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(defaultText, style: TextStyle(fontSize: 30.0)),
              Text(startNumber, style: TextStyle(fontSize: 30.0)),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      RaisedButton(
                        child: Text(
                          'Click',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: displaySNumbers,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
