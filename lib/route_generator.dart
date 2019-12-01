import 'package:feud_demo/game_page/game_page.dart';
import 'package:feud_demo/game_page/gfeud_class.dart';
import 'package:feud_demo/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){

    //if data needs to be transferred between routes
    final args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/game_page':
        return MaterialPageRoute(builder: (_) => ChangeNotifierProvider<Gfeud>(
          builder: (context)=> Gfeud(),
            child: GamePage()));
    }

    //if there's an error it routes back home
    return MaterialPageRoute(builder: (_) => HomePage());
  }
}
