import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './piece.dart';
import './selectProvider.dart';

class Selected extends StatefulWidget {
  final int isBlack;
  final int isDot;
  final int isRound;
  final int isBord;
  int isSelectable = 1;
  int isSelected;
  final Function() callCallback;
  Selected(this.isBlack, this.isDot, this.isRound, this.isBord, this.isSelected,
      this.callCallback);
  @override
  State<Selected> createState() => _Selected();
}

class _Selected extends State<Selected> {
  @override
  Widget build(BuildContext context) {
    context.watch<UnCheck>().checked;
    return GestureDetector(
        onTap: () {
          if (widget.isSelectable == 1) {
            widget.callCallback();
            Provider.of<UnCheck>(context, listen: false).checkedUpdate();
            setState(() {
              widget.isSelected = 1;
            });
          }
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              border: widget.isSelected == 1
                  ? Border.all(
                      width: 5,
                      color: Colors.green,
                    )
                  : null,
              borderRadius: widget.isRound == 1
                  ? const BorderRadius.all(Radius.circular(100))
                  : null),
          child: Piece(
            isBlack: widget.isBlack,
            isBord: widget.isBord,
            isDot: widget.isDot,
            isRound: widget.isRound,
          ),
        ));
  }
}
