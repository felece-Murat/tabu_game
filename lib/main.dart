import 'package:flutter/material.dart';
import 'package:tabu_game/basic_screen.dart';

void main () => runApp(const StaticApp ());

class StaticApp extends StatelessWidget {
  const StaticApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BasicScreen (),
    );
  }
}