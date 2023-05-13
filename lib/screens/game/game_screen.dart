import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  final int gameId;
  const GameScreen({Key? key, required this.gameId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Game Screen with id $gameId');
  }
}
