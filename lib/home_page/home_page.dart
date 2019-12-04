import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text('Feud Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'GOOGLE',
                  style: Theme.of(context).textTheme.display2
              ),
              Text(
                'FEUD',
                style: Theme.of(context).textTheme.display2,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/game_page');
                },
                child: Text('PLAY', style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          )
        ],
      ),
    ),
    );
  }
}

