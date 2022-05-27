import 'package:flutter/material.dart';

class TabuButton extends StatefulWidget {
  final Color color;
  final String text;
  final VoidCallback function;
  var timerStatus;

  TabuButton(
      {Key? key,
      required this.color,
      required this.text,
      required this.function,
      required this.timerStatus});

  @override
  State<TabuButton> createState() => TabuButtonState();
}

class TabuButtonState extends State<TabuButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: MaterialButton(
          minWidth: 120,
          height: 70,
          onPressed: widget.timerStatus ? null : () => widget.function(),
          color: widget.color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          child: Text(widget.text,style: const TextStyle(color: Colors.white,fontSize: 20))
      ),
    );
  }
}
