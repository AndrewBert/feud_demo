import 'dart:convert';
import 'package:http/http.dart' as http;


class Gfeud {

  List<String> questions = [
    'Why are my toes',
    'What is the tallest',
    'How long until'
  ];
  String currentQuestion = '';
  String answer = '';
  List<String> usedQuestions = [];
  List suggestions = [];

  void play(){
    getRandomQuestion();
    getSuggestions(currentQuestion);
  }

  void getRandomQuestion(){
    if(questions.length == 0){
      questions.addAll(usedQuestions);
      usedQuestions.clear();
    }

    questions.shuffle();
    var selectedQuestion = questions.removeLast();
    usedQuestions.add(selectedQuestion);
    currentQuestion = selectedQuestion;
    print('Selected question: $selectedQuestion');
  }

  Future<void> getSuggestions(String question) async{
    String url = "suggestqueries.google.com";
    final _uri =
    Uri.https(url, "/complete/search", {'client': 'firefox', 'q': currentQuestion});


    var _response = await http.get(_uri, headers: {"Accept": "application/json"});

    var _toJsonData = json.decode(_response.body);
    print('Json data: $_toJsonData');
    suggestions.addAll(_toJsonData[1]);
    print('Length of suggestion: ${suggestions.length}');
    print('Suggestions: $suggestions}');

    for(String element in suggestions){
      element.replaceAll(currentQuestion.toLowerCase(), '');
    }

    for(int i=0; i<suggestions.length; i++){
      suggestions[i] = suggestions[i].replaceAll(currentQuestion, '');
    }

    print('This is the data: $suggestions');
  }

  void verifyAnswer(){
    print('Verifying answer');
  }

  String removePunctuation(){
    return 'Nothing';
  }





}