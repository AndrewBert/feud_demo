import 'dart:convert';
import 'package:feud_demo/game_page/answerbox_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'player_class.dart';
import 'dart:async';

class Gfeud with ChangeNotifier {
  List<String> questions = [
    'Why are my toes',
    'Can fish',
    'Why do men',
    'Is my dog'
  ];

  List<String> ignoreWords = [
    'a','about','above','across','after','afterwards','again',
    'against','all','almost','alone','along','already','also',
    'although','always','am','among','amongst','amoungst','amount',
    'an','and','another','any','anyhow','anyone','anything','anyway',
    'anywhere','are','around','as','at','back','be','became','because',
    'become','becomes','becoming','been','before','beforehand','behind',
    'being','below','beside','besides','between','beyond','bill','both',
    'bottom','but','by','call','can','cannot','cant','co','computer','con',
    'could','couldnt','cry','de','describe','detail','do','done','down',
    'due','during','each','eg','eight','either','eleven','else','elsewhere',
    'empty','enough','etc','even','ever','every','everyone','everything',
    'everywhere','except','few','fifteen','fify','fill','find','fire',
    'first','five','for','former','formerly','forty','found','four','from',
    'front','full','further','get','give','go','had','has','hasnt','have',
    'he','hence','her','here','hereafter','hereby','herein','hereupon',
    'hers','herself','him','himself','his','how','however','hundred','i',
    'ie','if','in','inc','indeed','interest','into','is','it','its',
    'itself','keep','last','latter','latterly','least','less','ltd',
    'made','many','may','me','meanwhile','might','mill','mine',
    'more','moreover','most','mostly','move','much','must',
    'my','myself','name','namely','neither','never','nevertheless',
    'next','nine','no','nobody','none','noone','nor','not','nothing',
    'now','nowhere','of','off','often','on','once','one','only','onto',
    'or','other','others','otherwise','our','ours','ourselves','out',
    'over','own','part','per','perhaps','please','put','rather','re',
    'same','see','seem','seemed','seeming','seems','serious','several',
    'she','should','show','side','since','sincere','six','sixty','so',
    'some','somehow','someone','something','sometime','sometimes',
    'somewhere','still','such','system','take','ten','than','that',
    'the','their','them','themselves','then','thence','there','thereafter',
    'thereby','therefore','therein','thereupon','these','they','thick','thin',
    'third','this','those','though','three','through','throughout','thru',
    'thus','to','together','too','top','toward','towards','twelve','twenty',
    'two','un','under','until','up','upon','us','very','via','was',
    'we','well','were','what','whatever','when','whence','whenever',
    'where','whereafter','whereas','whereby','wherein','whereupon',
    'wherever','whether','which','while','whither','who','whoever',
    'whole','whom','whose','why','will','with','within','without',
    'would','yet','you','your','yours','yourself','yourselves'
  ];

  Gfeud() {
    play();
  }

  void play() {
    createPlayers();
    questions.shuffle();
    getQuestionAndAnswers();
  }

  int numPlayers = 2;
  List<Player> players = [];
  void createPlayers() {
    for (int i = 0; i < numPlayers; i++) {
      players.add(Player());
    }
  }

  String currentQuestion = '';
  List<String> usedQuestions = [];
  List suggestions = [];
  AnswerBoxes answerBoxes = AnswerBoxes();
  //todo make a fun for populating text

  Future<void> getQuestionAndAnswers() async {
    if (questions.length == 0) {
      questions.addAll(usedQuestions);
      usedQuestions.clear();
    }

    currentQuestion = questions.removeLast();
    usedQuestions.add(currentQuestion);
    print('Selected question: $currentQuestion');

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
      suggestions[i] = suggestions[i].toString()
          .replaceAll('${currentQuestion.toLowerCase()}', '')
          .trim();
    }

    answerBoxes.create(suggestions);



    //todo Make it so "Why do we" doesn't have a suggestion like "Why do web dev"

    print('Suggestions: $suggestions}');
    //print('Length of suggestion: ${suggestions.length}');
  }

  List<int> pointValues = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];
  List<String> usedSuggestions = [];
  static const int NUM_GUESSES = 0;
  int remainingGuesses = NUM_GUESSES;
  int positionOfCurrentPlayer = 0;

  void checkAnswerCalcPoints(String userAnswer) async {
    print('Checking answer');
    userAnswer = userAnswer.trim().toLowerCase();
    bool matchFound = false;
    bool someMatchFound = false;
    for (int i = 0; i < suggestions.length; i++) {
      //todo if a suggestion contains a user answer that is longer than 3 characters, give points
      if(suggestions[i].toString().contains(userAnswer.trim()) && userAnswer.length>2){
        matchFound = true;
        someMatchFound = true;
      }
      if (suggestions[i] == userAnswer &&
          !usedSuggestions.contains(userAnswer)) {
        matchFound = true;
        someMatchFound =true;
      }

      if(matchFound){
        usedSuggestions.add(suggestions[i]);
        currentPlayer.points += pointValues[i];
        print('Answer match: +${pointValues[i]}');
        print('Player ${positionOfCurrentPlayer + 1}: ${currentPlayer.points}');
        answerBoxes.items[i].revealAnswer();
        updatePoints();
        //todo make a next turn button once a player guesses for consistency
      }
      matchFound = false;
    }
    if (!someMatchFound) {
      print('No match was found');
    }

    if (remainingGuesses == 0 && positionOfCurrentPlayer == players.length-1) {
      nextRound();
    } else {
      await new Future.delayed(const Duration(seconds: 3));
      nextPlayersTurn();
    }
    notifyListeners();
  }


  void nextPlayersTurn() {
    if (positionOfCurrentPlayer != numPlayers - 1) {
      positionOfCurrentPlayer++;
    } else {
      positionOfCurrentPlayer = 0;
      remainingGuesses--;
      print('Remaining Guesses: $remainingGuesses');
    }
    setTextColor();
    print('Player ${positionOfCurrentPlayer + 1}s Turn');
    updatePoints();

    notifyListeners();
    //todo add a text to display who's turn it is
  }

  static Color myTurnColor = Colors.blue;
  static Color notMyTurnColor = Colors.grey;
  Color colorPlayer1Text = myTurnColor;
  Color colorPlayer2Text = notMyTurnColor;

  void setTextColor(){
    if(positionOfCurrentPlayer == 0){
      colorPlayer1Text = myTurnColor;
      colorPlayer2Text = notMyTurnColor;
    }else{
      colorPlayer2Text = myTurnColor;
      colorPlayer1Text = notMyTurnColor;
    }
  }

  int numRounds = 3;
  int round = 1;
  void nextRound() async{
    round++;
    if (round > numRounds) {
      gameOver();
    } else {
      await new Future.delayed(const Duration(seconds: 3));
      chooseRoundWinner();
      print('Round #$round');
      remainingGuesses = NUM_GUESSES;
      positionOfCurrentPlayer = 0;
      setTextColor();
      answerBoxes.resetItems();
      updatePoints();
      getQuestionAndAnswers();
      //print('Remaing Questions: $questions');

      notifyListeners();
    }
  }

  Player get currentPlayer => players[positionOfCurrentPlayer];

  String currentPlayerPointsText = 'P1: 0';
  String player1ScoreText = 'P1: 0';
  String player2ScoreText = 'P2: 0';
  void updatePoints() {
    if(positionOfCurrentPlayer == 0){
      player1ScoreText = 'P1: ${currentPlayer.points}';
    }else{
      player2ScoreText = 'P2: ${currentPlayer.points}';
    }
    //currentPlayerPointsText = 'P${positionOfCurrentPlayer+1}: ${currentPlayer.points}';
    notifyListeners();
  }

  void chooseRoundWinner() {
    //todo make a case if there is a tie
    int winnerIndex = 0;
    int winnerPoints = 0;
    for (int i = 0; i < numPlayers; i++) {
      if (players[i].points > winnerPoints) {
        winnerIndex = i;
      }
    }
    print('Player ${winnerIndex + 1} wins this round!');
    players[winnerIndex].roundsWon++;
  }

  bool gameIsOver = false;
  void gameOver(){
    print('Game Over!');
    gameIsOver = true;

    notifyListeners();

  }
}

//todo ignore trailing whitspaces in user answer
//todo reveal answers once guessed correctly