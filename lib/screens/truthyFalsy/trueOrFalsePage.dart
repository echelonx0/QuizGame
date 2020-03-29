import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wakapost/modules/generalQuizBrain.dart';
import 'package:wakapost/screens/completedPage.dart';
import 'package:wakapost/utilities/constants.dart';

QuizBrain quizBrain = QuizBrain();

class TrueOrFalsePage extends StatefulWidget {
  @override
  _TrueOrFalsePageState createState() => _TrueOrFalsePageState();
}

class _TrueOrFalsePageState extends State<TrueOrFalsePage> {
  int questionNumber = 0;
  List<Widget> scoreKeeper = [];
  int score = 0;
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
            _start = 30;
            setState(() {
              gameStarted = false;
            });
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GameOverPage()));
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  void endGame() {
    _timer.cancel();
    _start = 30;
    quizBrain.reset();
    scoreKeeper = [];
    setState(() {
      gameStarted = false;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(() {
      //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If so,
      //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
      if (quizBrain.isFinished() == true) {
        endGame();
//        quizBrain.reset();
//        scoreKeeper = [];
//        setState(() {
//          gameStarted = false;
//        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GameOverPage()));
      }

      //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below 👇
      else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
//          //ToDo Navigate to sad face page
          endGame();

//          quizBrain.reset();
//          scoreKeeper = [];
//          _timer.cancel();
//          setState(() {
//            _start = 30;
//          });
//          gameStarted = false;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => GameOverPage()));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return gameStarted == true
        ? Scaffold(
            backgroundColor: Colors.black87,
            appBar: AppBar(
              backgroundColor: Colors.black54,
              elevation: 0,
              title: Text(
                "Maths Quiz",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    //flex: 2,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "Question   ",
                              style: kRedBgButtonTextStyle,
                            ),
                            Text(
                              "01/",
                              style: kRedBgButtonTextStyle,
                            ),
                            Text(
                              "20",
                              style: kRedBgButtonTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          children: scoreKeeper,
                        )
                        //Todo add ro

                        //Row(children: <Widget>[scoreList],),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            quizBrain.getQuestionText(),
                            style: kRedBgButtonTextStyle,
                          ),
                        )),
                        Card(
                          child: ListTile(
                            onTap: () {
                              checkAnswer(true);
                            },
                            title: const Text(
                              'True',
                              style: kNormalTextStyle,
                            ),
                            trailing: Icon(Icons.check),
                            // secondary: const Icon(Icons.hourglass_empty),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            onTap: () {
                              checkAnswer(false);
                            },
                            title: const Text(
                              'False',
                              style: kNormalTextStyle,
                            ),
                            trailing: Icon(Icons.close),
                            // secondary: const Icon(Icons.hourglass_empty),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.power_settings_new,
                                color: Colors.white,
                              ),
                              FlatButton(
                                child: Text(
                                  "End Quiz",
                                  style: kButtonTextStyle,
                                ),
                                onPressed: () {
                                  endGame();
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Text(
                              "$_start",
                              style: kButtonTextStyle,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Are you ready to play?",
                  style: TextStyle(fontSize: 35),
                ),
                FlatButton(
                  child: Center(child: Text("Let's do this!")),
                  onPressed: () {
                    setState(() {
                      gameStarted = true;
                      startTimer();
                    });
                  },
                )
              ],
            ),
          );
  }
}
