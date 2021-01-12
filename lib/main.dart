import 'dart:async';
import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(MyApp());
}

bool status2 = false;
bool status3 = false;
bool status4 = false;
bool status5 = false;
bool status6 = false;
bool change = true;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Timer _timer;
  int _start = 10;
  int dice1 = 1;
  int dice2 = 1;
  int dice3 = 1;
  int dice4 = 1;
  int dice5 = 1;
  int dice6 = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DICE",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Dice',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Revamped',
            ),
          ),
          backgroundColor: Colors.cyanAccent,
        ),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            // Set the transparency here
            canvasColor: Colors
                .black45, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
          ),
          isMaterialAppTheme: true,
          child: MyDrawer(),
        ),
        body: GestureDetector(
          onTap: () {
            setState(() {
              change = false;
            });

            _timer = Timer(Duration(seconds: 1), () {
              setState(() {
                change = true;
                dice1 = Random().nextInt(6) + 1;
                dice2 = Random().nextInt(6) + 1;
                dice3 = Random().nextInt(6) + 1;
                dice4 = Random().nextInt(6) + 1;
                dice5 = Random().nextInt(6) + 1;
                dice6 = Random().nextInt(6) + 1;
              });
            });
          },
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image(
                image: AssetImage('images/blue.jpg'),
                fit: BoxFit.cover,
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      DiceWidget(
                        dice: dice1,
                      ),
                      status2 == true
                          ? DiceWidget(
                        dice: dice2,
                      )
                          : Container(),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      status3 == true
                          ? DiceWidget(
                        dice: dice3,
                      )
                          : Container(),
                      status4 == true
                          ? DiceWidget(
                        dice: dice4,
                      )
                          : Container(),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      status5 == true
                          ? DiceWidget(
                        dice: dice5,
                      )
                          : Container(),
                      status6 == true
                          ? DiceWidget(
                        dice: dice6,
                      )
                          : Container(),
                    ],
                  ),
                ],
              ),
            ),

            ],
          ),
        ),
      ),
    );
  }
}

class DiceWidget extends StatelessWidget {
  final int dice;

  DiceWidget({this.dice});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$dice',
            style: TextStyle(
                color: Colors.white, fontSize: 50, fontFamily: 'Revamped'),
          ),
          change == true
              ? Image.asset('images/dice$dice.png')
              : SpinKitCubeGrid(
                  color: Colors.cyanAccent,
                  size: 100.0,
                ),
        ],
      ),
    );
  }
}

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 1.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 1.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                          child: Text(
                            "DICE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Revamped',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Center(
                                  child: Text(
                            "dice 2",
                            style: TextStyle(color: Colors.white, fontSize: 20     ,fontFamily: 'Revamped',),
                          ))),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CustomSwitch(
                                  activeColor: Colors.greenAccent,
                                  value: status2,
                                  onChanged: (value) {
                                    setState(() {
                                      status2 = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Center(
                                  child: Text(
                                    "dice 3",
                                    style: TextStyle(color: Colors.white, fontSize: 20     ,fontFamily: 'Revamped',),
                                  ))),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CustomSwitch(
                                  activeColor: Colors.greenAccent,
                                  value: status3,
                                  onChanged: (value) {
                                    setState(() {
                                      status3 = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Center(
                                  child: Text(
                                    "dice 4",
                                    style: TextStyle(color: Colors.white, fontSize: 20     ,fontFamily: 'Revamped',),
                                  ))),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CustomSwitch(
                                  activeColor: Colors.greenAccent,
                                  value: status4,
                                  onChanged: (value) {
                                    setState(() {
                                      status4 = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Center(
                                  child: Text(
                                    "dice 5",
                                    style: TextStyle(color: Colors.white, fontSize: 20     ,fontFamily: 'Revamped',),
                                  ))),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CustomSwitch(
                                  activeColor: Colors.greenAccent,
                                  value: status5,
                                  onChanged: (value) {
                                    setState(() {
                                      status5 = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Center(
                                  child: Text(
                                    "dice 6",
                                    style: TextStyle(color: Colors.white, fontSize: 20     ,fontFamily: 'Revamped',),
                                  ))),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CustomSwitch(
                                  activeColor: Colors.greenAccent,
                                  value: status6,
                                  onChanged: (value) {
                                    setState(() {
                                      status6 = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}