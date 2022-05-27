import 'package:flutter/material.dart';
import 'package:tabu_game/teamsData.dart';

class StartingButton extends StatefulWidget {
  final VoidCallback onCountSelected;
  final TeamsData team1;
  final TeamsData team2;
  final TeamsData starting;

  StartingButton(
      {Key? key, required this.onCountSelected,required this.team1, required this.team2, required this.starting})
      : super(key: key);

  @override
  State<StartingButton> createState() => StartingButtonState();
}

class StartingButtonState extends State<StartingButton> {
  bool started = false;
  late TeamsData _currentTeam ;
  //Made saperate component to decrease building time and ram usage because this component will build when timer started.

  @override
  void initState() {
    _currentTeam = widget.starting;
  }

  void enableButton() {
    setState(() {
      started = false;
    });
  }

  void disableButton() {
    setState(() {
      started = true;
    });
  }

  void changeCurrentTeam() {
    if (_currentTeam == widget.team1) {
      setState(() => _currentTeam = widget.team2);
    } else {
      setState(() => _currentTeam = widget.team1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 70,
      child: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: MaterialButton(
            child: Text(
              _currentTeam.teamName + " START",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            minWidth: 120,
            color: Colors.amber,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: started
                ? null
                : () {
                    widget.onCountSelected();
                    setState(() => started = true);
                  },
          )),
    );
  }
}
