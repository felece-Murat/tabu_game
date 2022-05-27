import 'package:flutter/material.dart';
import 'package:tabu_game/tabu_button.dart';

class PointingButtons extends StatefulWidget {
  final VoidCallback onTrueButtonSelected;
  final VoidCallback onPassButtonSelected;
  final VoidCallback onTabuButtonSelected;

  PointingButtons(
      {Key? key,
      required this.onTrueButtonSelected,
      required this.onPassButtonSelected,
      required this.onTabuButtonSelected})
      : super(key: key);

  @override
  State<PointingButtons> createState() => PointingButtonsState();
}

class PointingButtonsState extends State<PointingButtons> {
  bool timerStatus = true;

  void disableButtons() => setState(() {
    timerStatus = true;
  });

  void enableButtons() => setState(() {
    timerStatus = false;
  });


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TabuButton(
                timerStatus: timerStatus,
                text: "TABU",
                color: Colors.red,
                function: widget.onTabuButtonSelected),
            TabuButton(
                timerStatus: timerStatus,
                text: "PASS",
                color: Colors.indigo,
                function: widget.onPassButtonSelected),
            TabuButton(
                timerStatus: timerStatus,
                text: "TRUE",
                color: Colors.green,
                function: widget.onTrueButtonSelected),
          ]))
    ]);
  }
}
