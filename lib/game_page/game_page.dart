import 'package:feud_demo/game_page/gfeud_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //final gfeud = Provider.of<Gfeud>(context, listen: false);
    final TextEditingController controller = TextEditingController();
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
                      builder: (_, gfeud, __)=>
                      Text(gfeud.currentQuestion,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),)
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Consumer<Gfeud>(
                    builder: (_, gfeud, __) =>
                    TextField(
                      controller: controller,
                      onSubmitted: (String answer){
                        if(answer.isNotEmpty) {
                          //todo fix this line
                          gfeud.checkAnswerCalcPoints(answer);
                          controller.clear();
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter answer here'
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Consumer<Gfeud>(
                      builder: (_, gfeud, __) =>
                          Text(
                            ' ${gfeud.player1ScoreText}',
                            style: TextStyle(color: gfeud.colorPlayer1Text, fontSize: 45),

                          ),
                    ),
                    Consumer<Gfeud>(
                      builder: (_, gfeud, __) =>
                          Text(
                            ' ${gfeud.player2ScoreText}',
                            style: TextStyle(color: gfeud.colorPlayer2Text, fontSize: 45),
                          ),
                    ),
                  ],
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
                            child: Consumer<Gfeud>(
                              builder: (_,gfeud,__)=>
                              FlatButton(
                                disabledColor: gfeud.answerBoxes.items[0].color,
                                disabledTextColor: Colors.white,
                                onPressed: null,
                                child: Consumer<Gfeud>(
                                  builder: (_, gfeud,__) =>
                                  Text(gfeud.answerBoxes.items[0].text, style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 160,
                            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                            child: Consumer<Gfeud>(
                              builder: (_,gfeud,__)=>
                                  FlatButton(
                                    disabledColor: gfeud.answerBoxes.items[1].color,
                                    disabledTextColor: Colors.white,
                                    onPressed: null,
                                    child: Consumer<Gfeud>(
                                      builder: (_, gfeud,__) =>
                                          Text(gfeud.answerBoxes.items[1].text, style: TextStyle(fontSize: 20),
                                          ),
                                    ),
                                  ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 160,
                            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                            child: Consumer<Gfeud>(
                              builder: (_,gfeud,__)=>
                                  FlatButton(
                                    disabledColor: gfeud.answerBoxes.items[2].color,
                                    disabledTextColor: Colors.white,
                                    onPressed: null,
                                    child: Consumer<Gfeud>(
                                      builder: (_, gfeud,__) =>
                                          Text(gfeud.answerBoxes.items[2].text, style: TextStyle(fontSize: 20),
                                          ),
                                    ),
                                  ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 160,
                            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                            child: Consumer<Gfeud>(
                              builder: (_,gfeud,__)=>
                                  FlatButton(
                                    disabledColor: gfeud.answerBoxes.items[3].color,
                                    disabledTextColor: Colors.white,
                                    onPressed: null,
                                    child: Consumer<Gfeud>(
                                      builder: (_, gfeud,__) =>
                                          Text(gfeud.answerBoxes.items[3].text, style: TextStyle(fontSize: 20),
                                          ),
                                    ),
                                  ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 160,
                            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                            child: Consumer<Gfeud>(
                              builder: (_,gfeud,__)=>
                                  FlatButton(
                                    disabledColor: gfeud.answerBoxes.items[4].color,
                                    disabledTextColor: Colors.white,
                                    onPressed: null,
                                    child: Consumer<Gfeud>(
                                      builder: (_, gfeud,__) =>
                                          Text(gfeud.answerBoxes.items[4].text, style: TextStyle(fontSize: 20),
                                          ),
                                    ),
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
                            child: Consumer<Gfeud>(
                              builder: (_,gfeud,__)=>
                                  FlatButton(
                                    disabledColor: gfeud.answerBoxes.items[5].color,
                                    disabledTextColor: Colors.white,
                                    onPressed: null,
                                    child: Consumer<Gfeud>(
                                      builder: (_, gfeud,__) =>
                                          Text(gfeud.answerBoxes.items[5].text, style: TextStyle(fontSize: 20),
                                          ),
                                    ),
                                  ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 160,
                            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                            child: Consumer<Gfeud>(
                              builder: (_,gfeud,__)=>
                                  FlatButton(
                                    disabledColor: gfeud.answerBoxes.items[6].color,
                                    disabledTextColor: Colors.white,
                                    onPressed: null,
                                    child: Consumer<Gfeud>(
                                      builder: (_, gfeud,__) =>
                                          Text(gfeud.answerBoxes.items[6].text, style: TextStyle(fontSize: 20),
                                          ),
                                    ),
                                  ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 160,
                            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                            child: Consumer<Gfeud>(
                              builder: (_,gfeud,__)=>
                                  FlatButton(
                                    disabledColor: gfeud.answerBoxes.items[7].color,
                                    disabledTextColor: Colors.white,
                                    onPressed: null,
                                    child: Consumer<Gfeud>(
                                      builder: (_, gfeud,__) =>
                                          Text(gfeud.answerBoxes.items[7].text, style: TextStyle(fontSize: 20),
                                          ),
                                    ),
                                  ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 160,
                            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                            child: Consumer<Gfeud>(
                              builder: (_,gfeud,__)=>
                                  FlatButton(
                                    disabledColor: gfeud.answerBoxes.items[8].color,
                                    disabledTextColor: Colors.white,
                                    onPressed: null,
                                    child: Consumer<Gfeud>(
                                      builder: (_, gfeud,__) =>
                                          Text(gfeud.answerBoxes.items[8].text, style: TextStyle(fontSize: 20),
                                          ),
                                    ),
                                  ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 160,
                            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                            child: Consumer<Gfeud>(
                              builder: (_,gfeud,__)=>
                                  FlatButton(
                                    disabledColor: gfeud.answerBoxes.items[9].color,
                                    disabledTextColor: Colors.white,
                                    onPressed: null,
                                    child: Consumer<Gfeud>(
                                      builder: (_, gfeud,__) =>
                                          Text(gfeud.answerBoxes.items[9].text, style: TextStyle(fontSize: 20),
                                          ),
                                    ),
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
                    Consumer<Gfeud>(
                      builder: (_, gfeud, __) =>
                      Visibility(
                        visible: gfeud.gameIsOver,
                        maintainState: true,
                        child: Container(
                          height: 60,
                          width: 160,
                          child: Consumer<Gfeud>(
                            builder: (_, gfeud, __)=>
                            FlatButton(
                              child: Text('GAME OVER'),
                              textColor: Colors.white,
                              color: Colors.deepPurpleAccent,
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed('/endgame_page');
                              },
                            ),
                          ),
                        ),
                      ),
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
