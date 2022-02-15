import 'package:flutter/material.dart';
import 'package:quarto/game/game.dart';
import 'package:quarto/pages/how_to_play.dart';
class MainMenu extends StatelessWidget {
  const MainMenu({ Key? key }) : super(key: key);

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
            Text('Quarto',
            style: TextStyle(
              fontSize: 90,
              color: Colors.black,
              ),),
          Container(
            margin: EdgeInsets.only(top:30),
            height: 70,
            width: 250,
            child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.0),
                  side: BorderSide(color: Colors.grey)
                )
            ),
            ),
            onPressed: () =>{Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Game(title: 'Game',)))
        },
            child: Text('Pass and play',
                        style: TextStyle(fontSize: 25),))
          ),
          Container(
            margin: EdgeInsets.only(top:30),
            height: 70,
            width: 250,
            child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.0),
                  side: BorderSide(color: Colors.grey)
                )
            ),
            ),
            onPressed: () =>{Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HowToPlay()))
        },
            child: Text('How to play',
                        style: TextStyle(fontSize: 25),))
          ),
        ],
      )
      )
    ),
    );
  }
}