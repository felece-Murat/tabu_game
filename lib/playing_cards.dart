import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:tabu_game/teamsData.dart';

class PlayingCards extends StatefulWidget {
  final TeamsData team1;
  final TeamsData team2;
  final TeamsData starting;

  const PlayingCards({Key? key, required this.team1, required this.team2, required this.starting}) : super(key: key);

  @override
  State<PlayingCards> createState() => PlayingCardsState();
}

class PlayingCardsState extends State<PlayingCards> {
  int index = 0;
  late TeamsData _currentTeam ;

  @override
  void initState() {
    _currentTeam = widget.starting;
  }

  void changeCurrentTeam() {
    if (_currentTeam == widget.team1) {
      setState(() => _currentTeam = widget.team2);
    } else {
      setState(() => _currentTeam = widget.team1);
    }
  }

  void nextWord() {
    index++;
    if (index == 8) {
      index = 0;
    }
    setState(() => index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        builder: (context, snapshot) {
          var data = json.decode(snapshot.data.toString());
          return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    color: _currentTeam.teamColor,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 100),
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(data[index]['word'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white,fontSize: 35)),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 100),
                  width: double.infinity,
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12)),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(data[index]['1'], style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.grey)),
                      Divider(),
                      Text(data[index]['2'], style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.grey)),
                      Divider(),
                      Text(data[index]['3'], style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.grey)),
                      Divider(),
                      Text(data[index]['4'], style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.grey)),
                      Divider(),
                      Text(data[index]['5'], style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.grey)),
                    ],
                  ),
                ),
              ]);
        },
        future: DefaultAssetBundle.of(context).loadString("assets/words.json"),
      ),
        margin: const EdgeInsets.symmetric(vertical: 50)
    );
  }
}
