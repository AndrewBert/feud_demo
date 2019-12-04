import 'package:flutter/material.dart';

class EndGamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Game Over',),

        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Player X Wins!',
                  style: Theme.of(context).textTheme.display2
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'P1 Score',
                    style: Theme.of(context).textTheme.display1,
                  ),
                  Text(
                    'P2 Score',
                      style: Theme.of(context).textTheme.display1
                  )
                ],
              ),
              Container(
                height: 60,
                width: 160,
                child: FlatButton(
                  onPressed: (){
                    Navigator.of(context).popAndPushNamed('/');
                  },
                  child: Text('MENU'),
                  textColor: Colors.white,
                  color: Colors.deepPurpleAccent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
