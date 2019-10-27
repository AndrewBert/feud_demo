import 'package:feud_demo/game_page.dart';
import 'package:feud_demo/home_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){

    //if data needs to be transferred between routes
    final args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/game_page':
        return MaterialPageRoute(builder: (_) => GamePage());
    }

    //if there's an error it routes back home
    return MaterialPageRoute(builder: (_) => HomePage());
  }
}
