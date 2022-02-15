import 'package:flutter/material.dart';
import './select.dart';
import './selectProvider.dart';
import 'package:provider/provider.dart';

import './selectProvider.dart';

class PlacePiece extends StatefulWidget {
  Widget piece;
  Selected selected;
  void Function(Selected) prevPage;
  PlacePiece(this.piece, this.selected, this.prevPage);

  @override
  _PlacePieceState createState() => _PlacePieceState();
}

class _PlacePieceState extends State<PlacePiece> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.width + 25,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.grey.shade300,
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  'Player ${PlayerTurn.player}\'s turn',
                  style: TextStyle(fontSize: 30),
                )),
            Draggable<Widget>(
              data: widget.piece,
              onDragCompleted: () => {
                setState(() {
                  widget.piece = Container();
                })
              },
              child: Container(
                  margin: EdgeInsets.only(top: 15),
                  width: 100,
                  height: 100,
                  child: widget.piece),
              feedback: Container(width: 110, height: 110, child: widget.piece),
              childWhenDragging: Container(
                margin: EdgeInsets.only(top: 15),
                width: 100,
                height: 100,
              ),
            ),
            Container(
                height: 50,
                width: 200,
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    side: BorderSide(color: Colors.green))),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green)),
                    onPressed: () => {
                          if (widget.piece is Container)
                            widget.prevPage(widget.selected),
                        },
                    child: Text('Confirm',style: TextStyle(fontSize: 20,color: Colors.black)))),
          ],
        ),
      ),
    );
  }
}
