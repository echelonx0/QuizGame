import 'package:flutter/material.dart';
import 'package:wakapost/screens/mcq/mcqPage.dart';
import 'package:wakapost/screens/truthyFalsy/trueOrFalsePage.dart';
import 'package:wakapost/stackPage.dart';
import 'package:wakapost/utilities/constants.dart';
import 'completedPage.dart';

List<Widget> _allPages = <Widget>[
  // ToDo Add a landing page with user instructions
  //ToDo add a post offer page
  StackPage(),
  TrueOrFalsePage(),
  MultiChoicePage(),
  GameOverPage()
];

class MainDashboard extends StatefulWidget {
  MainDashboard({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainDashboard>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: _allPages.length);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white54,
      body: TabBarView(
          controller: _controller,
          children: _allPages.map<Widget>((widget) {
            return SafeArea(
              top: false,
              bottom: false,
              child: Container(
                  key: ObjectKey(widget),
                  padding: const EdgeInsets.all(0),
                  child: widget),
            );
          }).toList()),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Color(0XFFff7961),
                ),
                onPressed: () {
                  _showModal();
                }),
            IconButton(
              onPressed: () {

              },
              icon: Icon(
                Icons.search,
                color: Color(0XFFff7961),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showModal() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new ListTile(
                leading: new Icon(
                  Icons.home,
                  color: Color(0XFFff7961),
                ),
                title: new Text(
                  'Home',
                  style: kNormalTextStyle,
                ),
                onTap: () {
                  _controller.animateTo(0);
                  Navigator.pop(context);
                },
              ),
              new ListTile(
                leading: new Icon(
                  Icons.music_note,
                  color: Color(0XFFff7961),
                ),
                title: new Text(
                  'Settings',
                  style: kNormalTextStyle,
                ),
                onTap: () {
                  _controller.animateTo(1);
                  Navigator.pop(context);
                },
              ),
              new ListTile(
                leading: new Icon(
                  Icons.music_note,
                  color: Color(0XFFff7961),
                ),
                title: new Text(
                  'McQ 3',
                  style: kNormalTextStyle,
                ),
                onTap: () {
                  _controller.animateTo(2);
                  Navigator.pop(context);
                },
              ),
               ListTile(
                leading: new Icon(
                  Icons.music_note,
                  color: Color(0XFFff7961),
                ),
                title: new Text(
                  'MCQ',
                  style: kNormalTextStyle,
                ),
                onTap: () {
                  _controller.animateTo(3);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
