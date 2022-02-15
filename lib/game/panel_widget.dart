import 'package:flutter/material.dart';
import 'select.dart';
import './selectProvider.dart';

class PanelWidget extends StatelessWidget {
  ScrollController controller;
  List<Selected> pieces;
  void Function() nextPage;
  PanelWidget(
      {Key? key,
      required this.controller,
      required this.pieces,
      required this.nextPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: ListView(controller: controller, 
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ 
                  Container(
                  margin: EdgeInsets.only(bottom: 10,left: 10),
                  child: Text('Player ${PlayerTurn.player}',
                  style: TextStyle(fontSize: 30),)),
                  Container(
                  width: 180,
                  margin: EdgeInsets.only(left: 20, top: 10, bottom: 20),
                  height: 50,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  side: BorderSide(color: Colors.green))),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green)),
                      child: Text('Confirm',style: TextStyle(fontSize: 30,color: Colors.black)),
                      onPressed: () {
                        nextPage();
                      }),
        ),  ],),
        Container(
          margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
          child: GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              crossAxisCount: 4,
            ),
            children: pieces,
          ),
        ),
        
      ]),
    );
  }
}
