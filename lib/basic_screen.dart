import 'package:flutter/material.dart';
import 'package:tabu_game/buttons.dart';
import 'package:tabu_game/playing_cards.dart';
import 'package:tabu_game/starting_button.dart';
import 'package:tabu_game/teams.dart';
import 'package:tabu_game/teamsData.dart';

class BasicScreen extends StatelessWidget {
  GlobalKey<TeamsState> teamsGlobalKey = GlobalKey();
  GlobalKey<PlayingCardsState> cardsGlobalKey = GlobalKey();
  GlobalKey<StartingButtonState> startingButtonKey = GlobalKey();
  GlobalKey<PointingButtonsState> buttonsState = GlobalKey();

  BasicScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    var team1 = TeamsData(0, Colors.green, "TEAM-1");
    var team2 = TeamsData(0, Colors.red, "TEAM-2");

    var currentTeam = team1;

    void changeCurrentTeam() {
      if (currentTeam == team1) {
        currentTeam = team2;
      } else {
        currentTeam = team1;
      }
    }

    return Scaffold(
      backgroundColor: const Color(-16738424),
      body: Column(
        children: [
          Teams(
            key: teamsGlobalKey,
            timerDone: () {
              startingButtonKey.currentState?.enableButton();
              startingButtonKey.currentState?.changeCurrentTeam();
              buttonsState.currentState?.disableButtons();
              cardsGlobalKey.currentState?.changeCurrentTeam();
              changeCurrentTeam();
            },
            team1: team1,
            team2: team2,
            currentTeam: currentTeam,
          ),
          Expanded(
              flex: 1,
              child: PlayingCards(
                key: cardsGlobalKey,
                team1: team1,
                team2: team2,
                starting: team1,
              )),
          Column(children: [
            StartingButton(
              key: startingButtonKey,
              onCountSelected: () {
                teamsGlobalKey.currentState?.startTimer();
                buttonsState.currentState?.enableButtons();
              },
              team1: team1,
              team2: team2,
              starting: team1,
            ),
            PointingButtons(
              key: buttonsState,
              onTabuButtonSelected: () {
                teamsGlobalKey.currentState?.pointing(-1, currentTeam);
                cardsGlobalKey.currentState?.nextWord();
              },
              onPassButtonSelected: () {
                cardsGlobalKey.currentState?.nextWord();
              },
              onTrueButtonSelected: () {
                teamsGlobalKey.currentState?.pointing(1, currentTeam);
                cardsGlobalKey.currentState?.nextWord();
              },
            ),
          ]),
        ],
      ),
    );
  }
}
