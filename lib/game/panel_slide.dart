import 'package:flutter/material.dart';
import './panel_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import './select.dart';
import './panel_widget.dart';

class PanelSlide extends StatefulWidget {
  List<Selected> pieces;
  void Function() nextPage;
  PanelSlide(this.pieces, this.nextPage);

  @override
  _PanelSlideState createState() => _PanelSlideState();
}

class _PanelSlideState extends State<PanelSlide> {
  double panelHeight = 250;
  @override
  Widget build(BuildContext context) {
    panelHeight = (((widget.pieces.length / 4).ceil()+1) * (MediaQuery.of(context).size.width-40)/4) + 40;
    print(panelHeight);
    if (panelHeight < MediaQuery.of(context).size.height - MediaQuery.of(context).size.width - 25)
      panelHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).size.width - 25;
    return Container(
      child: SlidingUpPanel(
        panelBuilder: (controller) => PanelWidget(
            controller: controller,
            pieces: widget.pieces,
            nextPage: widget.nextPage),
        minHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).size.width - 25,
        maxHeight: panelHeight,
      ),
    );
  }
}
