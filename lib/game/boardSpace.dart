import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './selectProvider.dart';

class BoardSpace extends StatefulWidget {
  int isEmpty = 1;
  int dragable = 1;
  Widget child = Container();
  Widget dragChild = Container();
  BoardSpace({Key? key}) : super(key: key);

  @override
  _BoardSpaceState createState() => _BoardSpaceState();
}

class _BoardSpaceState extends State<BoardSpace> {
  @override
  Widget build(BuildContext context) {
    context.watch<FixPiece>().fixed;
    widget.dragChild = widget.dragable == 1
        ? Draggable<Widget>(
            data: widget.child,
            child: widget.child,
            feedback: Container(width: 110, height: 110, child: widget.child),
            childWhenDragging: Container(),
            onDragCompleted: () => setState(() {
              widget.isEmpty = 1;
              widget.child = Container();
            }),
          )
        : widget.child;
    return DragTarget<Widget>(
      builder: (BuildContext context, List<dynamic> accepted,
          List<dynamic> rejected) {
        return Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(colors: [
              Colors.white,
              Colors.black,
            ], radius: 1.25, focal: Alignment.center),
          ),
          child: widget.dragChild,
        );
      },
      onWillAccept: (data) {
        return widget.isEmpty == 1;
      },
      onAccept: (data) {
        setState(() {
          widget.child = data;
          widget.isEmpty = 0;
        });
      },
    );
  }
}
