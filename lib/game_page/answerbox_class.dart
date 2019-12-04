import 'package:flutter/material.dart';

class AnswerBoxes{
  List<AnswerBox> items = [AnswerBox(), AnswerBox(), AnswerBox(), AnswerBox(), AnswerBox(),
  AnswerBox(), AnswerBox(), AnswerBox(), AnswerBox(), AnswerBox()];
  final int length = 10;

  void create(List suggestions){
    List<int> pointValues = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];
    for(int i=0; i<items.length;i++){
      items[i].points = pointValues[i];
      items[i].answer = suggestions[i].toString();
    }
  }

  void resetItems(){
    for(int i=0; i<items.length; i++){
      items[i].reset();
    }
  }

}

class AnswerBox with ChangeNotifier {
  String text = 'Hidden';
  String answer = '';
  int points = 0;
  bool isRevealed = false;

  Color color = Colors.deepPurple;
  Color revealedColor = Colors.blue;

  void revealAnswer(){
    text = '$answer: +$points';
    isRevealed = true;
    color = revealedColor;
    notifyListeners();
  }

  void reset(){
    //todo left off here, implement
    text = 'Hidden';
    answer = '';
    points = 0;
    isRevealed = false;
    color = Colors.deepPurple;
    //notifyListeners();
  }


  //todo possibly make a custom widget for this class
}