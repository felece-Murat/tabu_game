import 'package:flutter/material.dart';

class TeamsData{
  String teamName = "";
  Color teamColor = Colors.white;
  int teamPoint = 0;

  TeamsData(this.teamPoint,this.teamColor,this.teamName) {
    print("takım oluşturuldu");
  }
}