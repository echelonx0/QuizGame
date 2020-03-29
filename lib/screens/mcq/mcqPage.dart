import 'package:flutter/material.dart';
import 'package:wakapost/utilities/constants.dart';

class MultiChoicePage extends StatefulWidget {
  @override
  _MultiChoicePageState createState() => _MultiChoicePageState();
}

class _MultiChoicePageState extends State<MultiChoicePage> {
  //Widget scoreList = List<widget>[];
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "One of these is not native to Africa but it can be found in only one continent in the world",
                      style: kRedBgButtonTextStyle,
                    ),
                  )),
                  Card(
                    child: CheckboxListTile(
                      title: const Text(
                        'Gazelle',
                        style: kNormalTextStyle,
                      ),
                      value: isChecked,
                      onChanged: (bool value) {
                        //setState(() { timeDilation = value ? 10.0 : 1.0; });
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      // secondary: const Icon(Icons.hourglass_empty),
                    ),
                  ),
                  Card(
                    child: CheckboxListTile(
                      title: const Text(
                        'Goat',
                        style: kNormalTextStyle,
                      ),
                      value: isChecked,
                      onChanged: (bool value) {
                        //setState(() { timeDilation = value ? 10.0 : 1.0; });
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      // secondary: const Icon(Icons.hourglass_empty),
                    ),
                  ),
                  Card(
                    child: CheckboxListTile(
                      title: const Text(
                        'Elephant',
                        style: kNormalTextStyle,
                      ),
                      value: isChecked,
                      onChanged: (bool value) {
                        //setState(() { timeDilation = value ? 10.0 : 1.0; });
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      // secondary: const Icon(Icons.hourglass_empty),
                    ),
                  ),
                  Card(
                    child: CheckboxListTile(
                      title: const Text(
                        'Kangaroo',
                        style: kNormalTextStyle,
                      ),
                      value: isChecked,
                      onChanged: (bool value) {
                        //setState(() { timeDilation = value ? 10.0 : 1.0; });
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
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
                        Icon(Icons.power_settings_new, color: Colors.white,),
                        FlatButton(
                            child: Text(
                          "End Quiz",
                          style: kButtonTextStyle,
                        ),
                          onPressed: (){
                              print("Quiz ended");
                          },

                        ),
                      ],
                    ),
                    MaterialButton(
                     // borderSide: ,
                      child: Text(
                        "Next",
                        style: kButtonTextStyle,
                      ),
                      color: Colors.blueGrey,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
