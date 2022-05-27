import 'package:flutter/material.dart';
import 'package:tabu_game/teamsData.dart';

class TeamScore extends StatefulWidget {
  final TeamsData team;

  TeamScore({Key? key, required this.team}) : super(key: key);

  @override
  State<TeamScore> createState() => TeamScoreState();
}

class TeamScoreState extends State<TeamScore> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: widget.team.teamColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              height: 40,
              width: 70,
              child: Center(child: Text(widget.team.teamPoint.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 22),))),
          Container(
              width: 70,
              padding: EdgeInsets.all(5),
              color: Colors.white,
              child: Text(widget.team.teamName, textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),))
        ],
      ),
    );
  }
}
