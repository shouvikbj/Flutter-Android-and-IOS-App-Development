import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // import images

  AssetImage circle = AssetImage("images/circle.png");
  AssetImage lucky = AssetImage("images/rupee.png");
  AssetImage unlucky = AssetImage("images/sadFace.png");

  // get an array

  List<String> itemArray;
  int luckyNumber;
  int count;
  String gameOver;
  bool won;

  // initialize array with 25 elements

  @override
  void initState() {
    super.initState();
    itemArray = List<String>.generate(25, (index) => "empty");
    generateRandomNumber();
    this.count = 5;
    this.gameOver = "";
    this.won = false;
  }

  generateRandomNumber() {
    int random = Random().nextInt(25);
    print(random);
    setState(() {
      this.luckyNumber = random;
    });
  }

  // define a getImage method

  AssetImage getImage(int index) {
    String currentState = itemArray[index];
    switch (currentState) {
      case "lucky":
        return lucky;
        break;
      case "unlucky":
        return unlucky;
        break;
    }
    return circle;
  }

  // playGame method

  playGame(int index) {
    if (luckyNumber == index) {
      setState(() {
        itemArray[index] = "lucky";
      });
    } else {
      setState(() {
        itemArray[index] = "unlucky";
      });
    }
  }

  // showAll

  showAll() {
    setState(() {
      itemArray = List<String>.filled(25, "unlucky");
      itemArray[luckyNumber] = "lucky";
    });
  }

  // resetAll

  resetGame() {
    setState(() {
      itemArray = List<String>.filled(25, "empty");
      this.count = 5;
      this.gameOver = "";
    });
    generateRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find and Win'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.yellow,
                Colors.white,
                Colors.lightBlue,
                Colors.lightBlue,
                Colors.white,
                Colors.yellow,
              ],
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  '\nTest Your Luck',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(20.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: itemArray.length,
                  itemBuilder: (context, i) => SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: RaisedButton(
                      // color: Color(0xFFE1DA00),
                      color: Colors.white,
                      onPressed: () {
                        this.playGame(i);
                        // if (this.count >= 1) {
                        //   this.count = this.count - 1;
                        // } 
                        this.count = this.count - 1;
                        if(this.count > 0){
                          if (i == luckyNumber) {
                            this.showAll();
                            this.gameOver = "Wohoo!! You Won!";
                          }
                        }
                        else if((i == luckyNumber) && (this.count == 0)){
                          this.showAll();
                          this.gameOver = "Wohoo!! You Won!";
                        }
                        else {
                          this.gameOver = "You Lost !!";
                          this.count = 0;
                          // this.won = true;
                          // this.resetGame();
                        }
                        
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image(
                        image: this.getImage(i),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  this.gameOver,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Text(
                  '\nTries left : $count',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: RaisedButton(
                  onPressed: () {
                    this.showAll();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Colors.blue,
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Show All',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: RaisedButton(
                  onPressed: () {
                    this.resetGame();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Colors.red,
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Reset Game',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
