import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_background/animated_background.dart';
import 'package:wakapost/utilities/constants.dart';

class GameOverPage extends StatefulWidget {
  final playerStatus;
  final playerScore;
  GameOverPage({this.playerScore, this.playerStatus});

  @override
  _GameOverPageState createState() => _GameOverPageState();
}

class _GameOverPageState extends State<GameOverPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(),
        vsync: this,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.trophy,
                size: 180,
                color: Colors.red,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Congratulations!!!!",
                style: TextStyle(fontSize: 35),
              ),
              Text('You are a winner among winners!'),
              SizedBox(
                height: 25,
              ),
              Text(
                'Your score',
                style: kHoneTextStyle,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                '20/20',
                style: TextStyle(fontSize: 25),
              ),
              Text(
                'Earned Coins',
                style: kHoneTextStyle,
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Icon(FontAwesomeIcons.coins),SizedBox(width: 15,), Text("500")],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.share,
                          color: Colors.red,
                        ),
                        FlatButton(
                          child: Text(
                            "Share",
                            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            print("Shared");
                          },
                        ),
                      ],
                    ),
                    FlatButton(
                      // borderSide: ,
                      child: Text(
                        "Play Again!",
                        style: kButtonTextStyle,
                      ),
                      color: Colors.red,
                      onPressed: () {
                        Navigator.pop(context);

                      },
                    )
                  ],
                ),
              ),
              IconButton(icon: Icon(Icons.close), onPressed: (){

              },)
            ],
          ),
        ),
      ),
    );
  }
}
