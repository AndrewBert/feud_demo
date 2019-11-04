import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  List _data;
  static String url = "suggestqueries.google.com";
  static String _question = 'Why is my ear';
  final _uri =
  Uri.https(url, "/complete/search", {'client': 'firefox', 'q': _question});

  Future<String> _getJsonData() async {
    var _response = await http.get(_uri, headers: {"Accept": "application/json"});

    var _toJsonData = json.decode(_response.body);
    _data = _toJsonData;
    _data = _data[1];
    print('This is the data: $_data');
    print('Length: ${_data.length}');


    return "Success";
  }

  void nextQuestion(){
    setState(() {
      _question = 'Question 2';
    });
    print(_question);
  }



  @override
  Widget build(BuildContext context) {
    _getJsonData();
    return Scaffold(
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
                  child: Text(_question, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
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
                    color: Colors.deepPurpleAccent,
                    onPressed: () {
                      nextQuestion();
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
