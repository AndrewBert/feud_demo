import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feud Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 50,
            width: 100,
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/game_page');
              },
              child: Text('PLAY', style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ],
      ),
    ),
    );
  }
}

