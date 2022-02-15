import 'package:flutter/material.dart';
import 'package:quarto/game/game.dart';

class GameWon extends StatelessWidget {
  final int player;
  final int tie;
  const GameWon({Key? key, required this.tie, required this.player})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: WonScreen(tie: tie,player: player));
  }
}

class WonScreen extends StatelessWidget {
  final int player;
  final int tie;
  const WonScreen({Key? key,required this.tie, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                tie == 1 ? 
                Text('Tie!',
                style: TextStyle(fontSize: 50),):
                Text(
                  'Player $player won!',
                  style: TextStyle(fontSize: 50),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: BorderSide(color: Colors.green)))),
                    onPressed: () => {
                          Navigator.pop(context),
                          
                        },
                    child: Text('View Board',
                    style: TextStyle(fontSize: 30))),
                ElevatedButton(
                  style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: BorderSide(color: Colors.green)))),
                    onPressed: () => {
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Game(
                                        title: 'Game',
                                      )))
                        },
                    child: Text('Restart',
                    style: TextStyle(fontSize: 30))),
                ElevatedButton(
                  style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: BorderSide(color: Colors.green)))),
                    onPressed: () => {
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst)
                        },
                    child: Text('MainMenu',
                    style: TextStyle(fontSize: 30))),
              ]),
        ),
      ),
    );
  }
}
