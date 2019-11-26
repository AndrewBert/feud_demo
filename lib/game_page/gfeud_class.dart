import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'player_class.dart';

class Gfeud with ChangeNotifier {
  List<String> questions = [
    'Why are my toes',
    'Can fish',
    'Why do men',
    'Is my dog'
  ];
  final Map pointValues = {
    0: 10,
    1: 9,
    2: 8,
    3: 7,
    4: 6,
    5: 5,
    6: 4,
    7: 3,
    8: 2,
    9: 1
  };
  String currentQuestion = '';
  String answer = '';
  List<String> usedQuestions = [];
  List suggestions = [];

  int numPlayers = 2;
  int positionOfCurrentPlayer = 0;
  List<Player> players = [];
  String currentPlayerPointsText = '0';

  Gfeud() {
    play();
  }

  void play() {
    createPlayers();
    questions.shuffle();
    getRandomQuestion();
    getSuggestions(currentQuestion);
  }

  void createPlayers() {
    for (int i = 0; i < numPlayers; i++) {
      players.add(Player());
    }
  }

  void getRandomQuestion() {
    if (questions.length == 0) {
      questions.addAll(usedQuestions);
      usedQuestions.clear();
    }

    var selectedQuestion = questions.removeLast();
    usedQuestions.add(selectedQuestion);
    currentQuestion = selectedQuestion;
    print('Selected question: $selectedQuestion');
    notifyListeners();
  }

  Future<void> getSuggestions(String question) async {
    String url = "suggestqueries.google.com";
    final _uri = Uri.https(
        url, "/complete/search", {'client': 'firefox', 'q': currentQuestion});

    var _response =
        await http.get(_uri, headers: {"Accept": "application/json"});

    var _toJsonData = json.decode(_response.body);
    //print('Json data: $_toJsonData');
    suggestions.clear();
    suggestions.addAll(_toJsonData[1]);
    for (int i = 0; i < suggestions.length; i++) {
      suggestions[i] = suggestions[i]
          .toString()
          .replaceAll('${currentQuestion.toLowerCase()}', '')
          .trim();
    }

    //todo Make it so "Why do we" doesn't have a suggestion like "Why do web dev"

    print('Suggestions: $suggestions}');
    //print('Length of suggestion: ${suggestions.length}');
  }

  void checkAnswerCalcPoints(String userAnswer) {
    print('Checking answer');
    bool matchFound = false;
    for (int i = 0; i < suggestions.length; i++) {
      if (suggestions[i] == userAnswer) {
        matchFound = true;
        suggestions.removeAt(i);
        currentPlayer.points += pointValues[i];
        updatePoints();

        print('Answer match: +${pointValues[i]}');

      }
    }
    if (!matchFound) {
      print('No match was found');
      if (currentPlayer.remainingGuesses == 0) {
        print('Next players turn');
      } else {
        currentPlayer.remainingGuesses -= 1;
      }
    }
    notifyListeners();
  }

  void nextPlayersTurn() {
    if (positionOfCurrentPlayer != numPlayers - 1) {
      positionOfCurrentPlayer++;
    } else {
      positionOfCurrentPlayer = 0;
    }
    print('Player ${positionOfCurrentPlayer+1}s Turn');
    updatePoints();

    getRandomQuestion();
    getSuggestions(currentQuestion);
    print('Remaing Questions: $questions');
    notifyListeners();
    //todo add a text to display whos turn it is
  }

  Player get currentPlayer => players[positionOfCurrentPlayer];

  void updatePoints(){
    currentPlayerPointsText =
    '${currentPlayer.points}';
  }

  String removePunctuation() {
    return 'Nothing';
  }
}
