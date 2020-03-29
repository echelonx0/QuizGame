import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  bool gameStarted = false;
  Timer _timer;
  int _start = 30;

  void startTimer() {

    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            //ToDo: End game and proceed to conclusion page
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return gameStarted == true ? Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Test Timer"),
              onPressed: () {
                startTimer();
//                Timer(Duration(seconds: 30), () {
//                  print("Yeah, this line is printed after 3 seconds");
//                  setState(() {
//                    if (_start < 1) {
//                      //timer.cancel();
//                      //ToDo: End game and proceed to conclusion page
//                    } else {
//                      _start = _start - 1;
//                    }
//                  });
//                });
              },
            ),
            Text("$_start")
          ],
        ),
      ),
    ) : Scaffold (
      body: Center(
        child: FlatButton(child: Text("Game Yet to Start"), onPressed: (){
          setState(() {
            gameStarted = !gameStarted;
          });
        },),
      ),
    );
  }
}

