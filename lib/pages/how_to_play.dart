import 'package:flutter/material.dart';

class HowToPlay extends StatelessWidget {
  const HowToPlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          margin: EdgeInsets.all(25),
          child: Column(children: [
            Text(
              'How to play\n',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 30),
            ),
            Text(
                'The objective of the game is to be the first to have 4 pieces in a line (vertically, horizontally, diagonally) with one common property.\n\nEach piece has 4 different characteristics: \n\nShape\nColor\nA dot\nBorder\n\nEach player places a piece and then choses one to give to his opponent to play.\n\nExamples of winning lines:\n',
                style: TextStyle(fontSize: 20),),
            Text('Common trait: Color',
            style: TextStyle(fontSize: 20)),
            Image.asset('images/color.png'),
            Text('Common trait: Dot',
            style: TextStyle(fontSize: 20)),
            Image.asset('images/dot.png'),
            Text('Common trait: No dot',
            style: TextStyle(fontSize: 20)),
            Image.asset('images/nodot.png'),
            Text('Common trait: No border',
            style: TextStyle(fontSize: 20)),
            Image.asset('images/no_border.png'),
            Text('Common trait: Shape (square)',
            style: TextStyle(fontSize: 20)),
            Image.asset('images/square.png'),
            Container(
              margin: EdgeInsets.only(top: 20),
              child:Text('May the best player win!',
            style: TextStyle(fontSize: 25))),
          ]),
        ),
        Container(
          height: 60,
          margin: EdgeInsets.only(left:50,right:50,bottom: 30),
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: BorderSide(color: Colors.green)))),
              onPressed: () => {
                    Navigator.pop(context),
                  },
              child: Text('MainMenu', style: TextStyle(fontSize: 30))),
        ),
      ]),
    );
  }
}
