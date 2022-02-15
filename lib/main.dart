// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quarto/pages/main_menu.dart';
import 'game/panel_slide.dart';

import 'game/select.dart';
import 'game/selectProvider.dart';
import 'game/placePiece.dart';
import 'game/boardSpace.dart';
import 'game/game_won.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => UnCheck(),
      ),
      ChangeNotifierProvider(
        create: (_) => FixPiece(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainMenu(),
    );
  }
}

