import 'package:flutter/material.dart';

class Piece extends StatelessWidget {
  final int isBlack;
  final int isDot;
  final int isRound;
  final int isBord;

  Piece(
      {this.isBlack = 0,
      this.isBord = 0,
      this.isDot = 0,
      this.isRound = 0,
      });
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      margin: EdgeInsets.all(3),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: isBlack == 1 ? Colors.pink.shade800 : Color(0xff0496ff),
            border: Border.all(
              width: isBord == 1 ? 10 : 0,
              color: Colors.black,
            ),
            borderRadius: isRound == 1
                ? const BorderRadius.all(Radius.circular(100))
                : null),
        child: isDot == 1
            ? Center(
              child: Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  ),))
            : null));
  }
}
