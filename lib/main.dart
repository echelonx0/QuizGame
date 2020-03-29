import 'package:flutter/material.dart';
import 'package:wakapost/screens/truthyFalsy/trueOrFalsePage.dart';

void main() {
  runApp(MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: MainDashboard(),
      //home: TimerPage(),
      home: TrueOrFalsePage(),
    );
  }

}
