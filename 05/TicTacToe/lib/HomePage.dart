import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // link up images

  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");
  AssetImage loader = AssetImage("images/circle.png");

  bool isCross = true;
  String message;
  String message2;
  List<String> gameState;

  // initialize the state of box with empty

  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
      this.message2 = "";
    });
  }

  // playGame method

  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }

  // Reset game method

  resetGame() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
      this.message2 = "";
      this.loader = AssetImage("images/circle.png");
    });
  }

  // getImage method

  AssetImage getImage(String value) {
    switch (value) {
      case ('empty'):
        return edit;
        break;
      case ('cross'):
        return cross;
        break;
      case ('circle'):
        return circle;
        break;
    }
  }

  // check for win logic

  checkWin() {
    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.message = '${this.gameState[0]} wins\n';
        this.message2 = "Resetting the Game\n";
        this.loader = AssetImage("images/loader.gif");
        Future.delayed(const Duration(milliseconds: 4000), () {
          this.resetGame();
        });
      });
    } else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message = '${this.gameState[3]} wins\n';
        this.message2 = "Resetting the Game\n";
        this.loader = AssetImage("images/loader.gif");
        Future.delayed(Duration(milliseconds: 4000), () {
          this.resetGame();
        });
      });
    } else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[6]} wins\n';
        this.message2 = "Resetting the Game\n";
        this.loader = AssetImage("images/loader.gif");
        Future.delayed(Duration(milliseconds: 4000), () {
          this.resetGame();
        });
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message = '${this.gameState[0]} wins\n';
        this.message2 = "Resetting the Game\n";
        this.loader = AssetImage("images/loader.gif");
        Future.delayed(Duration(milliseconds: 4000), () {
          this.resetGame();
        });
      });
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = '${this.gameState[1]} wins\n';
        this.message2 = "Resetting the Game\n";
        this.loader = AssetImage("images/loader.gif");
        Future.delayed(Duration(milliseconds: 4000), () {
          this.resetGame();
        });
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[2]} wins\n';
        this.message2 = "Resetting the Game\n";
        this.loader = AssetImage("images/loader.gif");
        Future.delayed(Duration(milliseconds: 4000), () {
          this.resetGame();
        });
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[0]} wins\n';
        this.message2 = "Resetting the Game\n";
        this.loader = AssetImage("images/loader.gif");
        Future.delayed(Duration(milliseconds: 4000), () {
          this.resetGame();
        });
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        this.message = '${this.gameState[2]} wins\n';
        this.message2 = "Resetting the Game\n";
        this.loader = AssetImage("images/loader.gif");
        Future.delayed(Duration(milliseconds: 4000), () {
          this.resetGame();
        });
      });
    } else if (!gameState.contains('empty')) {
      setState(() {
        this.message = "Game Draw\n";
        this.message2 = "Resetting the Game\n";
        this.loader = AssetImage("images/loader.gif");
        Future.delayed(Duration(milliseconds: 4000), () {
          this.resetGame();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TicTacToe",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
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
              Colors.blue
            ],
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(20.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: this.gameState.length,
                  itemBuilder: (context, i) => SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: MaterialButton(
                      onPressed: () {
                        this.playGame(i);
                      },
                      child: Image(
                        image: this.getImage(this.gameState[i]),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      this.message,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      this.message2,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image(
                      image: this.loader,
                      height: 35.0,
                      width: 35.0,
                    ),
                  ],
                ),
              ),
              MaterialButton(
                color: Color(0xFFF4C724),
                minWidth: 200.0,
                height: 50.0,
                child: Text(
                  "Reset Game",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  this.resetGame();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "By Shouvik Bajpayee",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
