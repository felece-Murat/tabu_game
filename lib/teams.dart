import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tabu_game/teamsData.dart';
import 'package:tabu_game/teams_score.dart';

class Teams extends StatefulWidget {
  final VoidCallback timerDone;
  final TeamsData team1;
  final TeamsData team2;
  final TeamsData currentTeam;

  const Teams({Key? key, required this.timerDone, required this.team1, required this.team2, required this.currentTeam,}) : super(key: key);

  @override
  State<Teams> createState() => TeamsState();
}

class TeamsState extends State<Teams> {
  int seconds = 30;
  late Timer timer;
  late TeamsData _currentTeam ;

  @override
  void initState() {
    super.initState();
    _currentTeam = widget.team1;
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), _onTick);
  }

  void _onTick(Timer timer) {
    setState(() {
      --seconds;
    });
    if (seconds == 0) {
      timer.cancel();
      widget.timerDone();
      setState(() {
        seconds = 30;
      });
    }
  }

  void pointing(int a, TeamsData team) {
    setState(() {
      team.teamPoint = team.teamPoint + a;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(builder: (ctx, constraints) {
          var widthOfParent = constraints.maxWidth - 90;
          return Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color(0xff00796a),
              ),
              height: 40.0,
              margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 35),
              padding:
                  EdgeInsets.only(left: (widthOfParent / 30) * (30 - seconds)),
              child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.limeAccent,
                  ),
                  margin: const EdgeInsets.all(6.0)));
        }),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TeamScore(team: widget.team1),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [
                  const Icon(
                    Icons.access_time_filled_rounded,
                    color: Colors.white,
                  ),
                  Text('$seconds',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20))
                ]),
              ),
              TeamScore(team: widget.team2),
            ],
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Color(0xff00796a),
          ),
          height: 75.0,
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          margin: const EdgeInsets.all(1.0),
        )
      ],
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
