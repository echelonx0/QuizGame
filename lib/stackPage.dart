import 'package:flutter/material.dart';
import 'package:wakapost/widgets/reusableCardWidget.dart';

class StackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          height: 250.0,
          decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 35,),
                  //Icon(Icons.person, color: Colors.yellowAccent,),
                  Row(
                    children: <Widget>[
                      Icon(Icons.person, color: Colors.white,),
                      SizedBox(width: 15,),
                      Text("Uchenna", style: TextStyle(color: Colors.white, fontSize: 18),),
                    ],
                  ),
                ],
              ),
        ),
        Positioned(
            top: 300,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text("Select a Quiz category", style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: "OpenSansItalic"),),
            )),
        Positioned(
            top: 320,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ReusableCard(
                        color: Colors.white,
                        label: Text("African"),
                        label2: Text("Trivia"),
                        icon: Icons.translate,
                        iconColor: Colors.deepOrangeAccent,
                      ),
                      ReusableCard(
                        color: Colors.white,
                        label: Text("Current"),
                        label2: Text("Affairs"),
                        icon: Icons.watch,
                        iconColor: Colors.brown,
                      ),
                      ReusableCard(
                        color: Colors.white,
                        label: Text("Random"),
                        label2: Text("Quiz"),
                        icon: Icons.all_inclusive,
                        iconColor: Colors.blue,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      ReusableCard(
                        color: Colors.white,
                        label: Text("History"),
                        label2: Text("Trivia"),
                        icon: Icons.book,
                        iconColor: Colors.pink,
                      ),
                      ReusableCard(
                        color: Colors.white,
                        label: Text("Vehicle"),
                        label2: Text("facts"),
                        icon: Icons.directions_car,
                        iconColor: Colors.brown,
                      ),
                      ReusableCard(
                        color: Colors.white,
                        label: Text("Military"),
                        label2: Text("Quiz"),
                        icon: Icons.gavel,
                        iconColor: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            )),
        Positioned(
          top: 80,
          left: 10,
          height: 200,
          width: MediaQuery.of(context).size.width * 0.95,
          child: Center(
            child: Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image.asset("assets/1.png", fit: BoxFit.fitHeight,),
                    Text("Igwe Uchenna")
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
