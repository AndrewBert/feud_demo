import 'package:flutter/material.dart';


class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Page'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text('The Question', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter answer here'
                    ),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: 60,
                          width: 150,
                          padding: EdgeInsets.symmetric(vertical: 8),
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
                          width: 150,
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
                          width: 150,
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
                          width: 150,
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
                          width: 150,
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
                        FlatButton(
                          disabledColor: Colors.deepPurple,
                          disabledTextColor: Colors.white,
                          onPressed: null,
                          child: Text('Hidden', style: TextStyle(fontSize: 20),
                          ),
                        ),
                        FlatButton(
                          disabledColor: Colors.deepPurple,
                          disabledTextColor: Colors.white,
                          onPressed: null,
                          child: Text('Hidden', style: TextStyle(fontSize: 20),
                          ),
                        ),
                        FlatButton(
                          disabledColor: Colors.deepPurple,
                          disabledTextColor: Colors.white,
                          onPressed: null,
                          child: Text('Hidden', style: TextStyle(fontSize: 20),
                          ),
                        ),
                        FlatButton(
                          disabledColor: Colors.deepPurple,
                          disabledTextColor: Colors.white,
                          onPressed: null,
                          child: Text('Hidden', style: TextStyle(fontSize: 20),
                          ),
                        ),
                        FlatButton(
                          disabledColor: Colors.deepPurple,
                          disabledTextColor: Colors.white,
                          onPressed: null,
                          child: Text('Hidden', style: TextStyle(fontSize: 20),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
