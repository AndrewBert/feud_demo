import 'package:feud_demo/game_page/gfeud_class.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Gfeud _gfeud = Gfeud();


  @override
  Widget build(BuildContext context) {
    print('Building');
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Game Page'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(_gfeud.currentQuestion, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    onSubmitted: (String answer){
                      if(answer.isNotEmpty) {
                        _gfeud.verifyAnswer();
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter answer here'
                    ),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 60,
                            width: 160,
                            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                            child: FlatButton(
                              disabledColor: Colors.deepPurple,
                              disabledTextColor: Colors.white,
                              onPressed: null,
                              child: Text('Hidden', style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 160,
                            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                            child: FlatButton(
                              disabledColor: Colors.deepPurple,
                              disabledTextColor: Colors.white,
                              onPressed: null,
                              child: Text('Hidden', style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 160,
                            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                            child: FlatButton(
                              disabledColor: Colors.deepPurple,
                              disabledTextColor: Colors.white,
                              onPressed: null,
                              child: Text('Hidden', style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 160,
                            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                            child: FlatButton(
                              disabledColor: Colors.deepPurple,
                              disabledTextColor: Colors.white,
                              onPressed: null,
                              child: Text('Hidden', style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 160,
                            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                            child: FlatButton(
                              disabledColor: Colors.deepPurple,
                              disabledTextColor: Colors.white,
                              onPressed: null,
                              child: Text('Hidden', style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 60,
                            width: 160,
                            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                            child: FlatButton(
                              disabledColor: Colors.deepPurple,
                              disabledTextColor: Colors.white,
                              onPressed: null,
                              child: Text('Hidden', style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 160,
                            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                            child: FlatButton(
                              disabledColor: Colors.deepPurple,
                              disabledTextColor: Colors.white,
                              onPressed: null,
                              child: Text('Hidden', style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 160,
                            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                            child: FlatButton(
                              disabledColor: Colors.deepPurple,
                              disabledTextColor: Colors.white,
                              onPressed: null,
                              child: Text('Hidden', style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 160,
                            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                            child: FlatButton(
                              disabledColor: Colors.deepPurple,
                              disabledTextColor: Colors.white,
                              onPressed: null,
                              child: Text('Hidden', style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 160,
                            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                            child: FlatButton(
                              disabledColor: Colors.deepPurple,
                              disabledTextColor: Colors.white,
                              onPressed: null,
                              child: Text('Hidden', style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  width: 160,
                  child: FlatButton(
                    child: Text('NEXT'),
                    textColor: Colors.white,
                    color: Colors.deepPurpleAccent,
                    onPressed: () {
                      setState(() {
                        _gfeud.play();
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
