import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './panel_slide.dart';

import './select.dart';
import './selectProvider.dart';
import './placePiece.dart';
import 'boardSpace.dart';
import 'game_won.dart';

class Game extends StatefulWidget {
  Game({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<Selected> pieces = [];
  int player = 1;
  Board board = Board(
    key: GlobalKey(),
  );
  List<Widget> game = [];
  bool isInit = false;
  List<Selected> initPiece() {
    for (int i = 0; i < 2; i++)
      for (int j = 0; j < 2; j++)
        for (int k = 0; k < 2; k++)
          for (int l = 0; l < 2; l++)
            pieces.add(Selected(i, j, k, l, 0, unCheck));
    game.add(board);
    game.add(PanelSlide(pieces, nextPage));
    PlayerTurn.changeWon(false);
    PlayerTurn.changePlayer(1);
    return pieces;
  }

  void setPlayer(int p) {
    player = p;
  }

  void unCheck() {
    for (var i in pieces) {
      i.isSelected = 0;
    }
  }

  void removeSelect() {
    for (var i in pieces) {
      if (i.isSelectable == 0) {
        pieces.remove(i);
        break;
      }
    }
  }

  bool isButtonAvailable() {
    for (var i in pieces) if (i.isSelected == 1) return true;
    return false;
  }

  void nextPage() {
    if (isButtonAvailable() && !PlayerTurn.gameWon) {
      if (PlayerTurn.player == 1) {
        PlayerTurn.changePlayer(2);
      } else {
        PlayerTurn.changePlayer(1);
      }
      game.removeLast();
      Selected selected = findCheck();
      game.add(PlacePiece(selected, selected, prevPage));
      setState(() {});
    }
  }

  void prevPage(Selected piece) {
    if (!PlayerTurn.gameWon) {
      ((board.key as GlobalKey).currentState! as _BoardState)._fixPieces(piece);
      Provider.of<FixPiece>(context, listen: false).fixPiece();
      game.removeLast();
      game.add(PanelSlide(pieces, nextPage));
      setState(() {});
    }
  }

  Selected findCheck() {
    for (var i in pieces) {
      if (i.isSelected == 1) {
        i.isSelectable = 0;
        i.isSelected = 0;
        return i;
      }
    }
    throw Error;
  }

  @override
  Widget build(BuildContext context) {
    pieces.isEmpty ? initPiece() : null;
    pieces.isEmpty ? null : removeSelect();
    return Scaffold(
      body: Container(
        color: Colors.grey.shade300,
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: game,
        ),
      ),
    );
  }
}

class Board extends StatefulWidget {
  Board({Key? key}) : super(key: key) {}
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List<BoardSpace> spaces = [];
  List board = [];
  int player = 1;
  void initBoard() {
    for (int i = 0; i < 16; i++) {
      spaces.add(BoardSpace());
      board.add([0, 0, 0, 0, 0]);
    }
  }

  int toLine(int i, int j) {
    return i * 4 + j;
  }

  void buildBoard(Selected piece, int pos) {
    board[pos][0] = 1; //has something
    board[pos][1] = piece.isBlack;
    board[pos][2] = piece.isBord;
    board[pos][3] = piece.isDot;
    board[pos][4] = piece.isRound;
    player = PlayerTurn.player;
    checkWin();
  }

  void checkLine(List one, List two, List three, List four) {
    for (int i = 1; i <= 4; i++) {
      if (one[i] == two[i] && two[i] == three[i] && three[i] == four[i]) {
        PlayerTurn.changeWon(true);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GameWon(tie: 0, player: player)),
        );
        break;
      }
    }
  }

  int checkWin() {
    for (int i = 0; i < 4; i++) {
      //horizontal
      for (int j = 0; j < 4; j++) {
        if (board[i * 4 + j][0] == 0) break;
        if (j == 3) {
          checkLine(board[i * 4 + j - 3], board[i * 4 + j - 2],
              board[i * 4 + j - 1], board[i * 4 + j]);
          return 1;
        }
      }
    }
    for (int i = 0; i < 4; i++) {
      //vertical
      for (int j = 0; j < 4; j++) {
        if (board[j * 4 + i][0] == 0) break;
        if (j == 3) {
          checkLine(board[(j - 3) * 4 + i], board[(j - 2) * 4 + i],
              board[(j - 1) * 4 + i], board[j * 4 + i]);
          return 1;
        }
      }
    }
    //first diagonal
    if (board[0][0] == 1 &&
        board[5][0] == 1 &&
        board[10][0] == 1 &&
        board[15][0] == 1) {
      checkLine(board[0], board[5], board[10], board[15]);
      return 1;
    }
    //second diagonal
    if (board[3][0] == 1 &&
        board[6][0] == 1 &&
        board[9][0] == 1 &&
        board[12][0] == 1) {
      checkLine(board[3], board[6], board[9], board[12]);
      return 1;
    }
    //check tie
    for (int i = 0; i < 16; i++) {
      if (board[i][0] == 0) break;
      if (i == 15) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GameWon(tie: 1, player: player)),
        );
      }
    }
    return 0;
  }

  void _fixPieces(Selected piece) {
    for (int i = 0; i < spaces.length; i++) {
      if (spaces[i].isEmpty == 0) {
        if (spaces[i].dragable == 1) buildBoard(piece, i);
        spaces[i].dragable = 0;
      }
    }
  }

  _BoardState() {
    initBoard();
  }
  @override
  Widget build(BuildContext context) {
    context.watch<FixPiece>().fixed;
    return Container(
      margin: EdgeInsets.only(top:25),
      color: Colors.grey.shade800,
      child: GridView(
        padding: EdgeInsets.all(8),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          crossAxisCount: 4,
        ),
        children: List<Widget>.from(spaces),
      ),
    );
  }
}
