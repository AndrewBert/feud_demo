import 'package:feud_demo/game_page/gfeud_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _gfeud = Provider.of<Gfeud>(context, listen: false);

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
                  child: Consumer<Gfeud>(
                      builder: (context, gfeud, child)=>
                      Text(_gfeud.currentQuestion, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    onSubmitted: (String answer){
                      if(answer.isNotEmpty) {
                        //todo fix this line
                        _gfeud.checkAnswerCalcPoints(answer);
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: 160,
                      child: Consumer<Gfeud>(
                        builder: (context, gfeud, child)=>
                        FlatButton(
                          child: Text('NEXT'),
                          textColor: Colors.white,
                          color: Colors.deepPurpleAccent,
                          onPressed: () {
                            gfeud.nextPlayersTurn();
                          },
                        ),
                      ),
                    ),
                    Consumer<Gfeud>(
                      builder: (context, gfeud, child) =>
                      Text(
                        gfeud.currentPlayerPointsText,
                        style: Theme.of(context).textTheme.display3,
                      ),
                    )
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
