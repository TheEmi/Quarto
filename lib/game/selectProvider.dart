import 'package:flutter/cupertino.dart';

class UnCheck with ChangeNotifier {
  bool checked = false;
  void checkedUpdate() {
    checked = true;
    notifyListeners();
    checked = false;
  }
}

class FixPiece with ChangeNotifier {
  bool fixed = false;
  void fixPiece() {
    fixed = true;
    notifyListeners();
    fixed = false;
  }
}

class PlayerTurn {
  static int player = 1;
  static bool gameWon = false;
  static changeWon(bool w) {
    gameWon = w;
  }

  static changePlayer(int p) {
    player = p;
  }
}
