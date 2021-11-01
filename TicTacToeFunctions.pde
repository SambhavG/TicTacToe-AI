/*
ai has 9 inputs and 9 outputs
0 for empty, .5 for opponent filled, 1 for self filled

Player 1: X, player 2: O, tie: 3

TicTacToe functions needed:

IncrementBoard: takes in board, player, returns board
IsMoveAllowed: takes in board, player, and move, returns true/false
IsGameWon: takes in board, returns 0 for play continues, 1 for player 1 wins, 2 for player 2 wins, and 3 for a tie


Board: [0,0,0,0,0,0,0,0,0]
Data variables: [(0) playerTurn, (1) isWon, (2) turnNumber, 

[1 2 3]
[4 5 6]
[7 8 9]

AI training:

100 ais are created, each plays 10 games with random ais, ais who lost more than 5 are deleted, rest are duplicated and randomized
Random ai from each round is stored to be played against

*/

int[] IncrementBoard(int[] boardInput, int player, int move) {
  int[] newBoard = boardInput;
  newBoard[move-1] = player;
  return newBoard;
}


boolean IsMoveAllowed(int[] boardInput, int player, int move) {
  
  if (boardInput[move-1] != 0) {
    return false;
  }
  
  int p1moves = 0;
  int p2moves = 0;
  for (int i = 0; i < 9; i++) {
    if (boardInput[i] == 1) {
      p1moves++;
    }
    if (boardInput[i] == 2) {
      p2moves++;
    }
  }
  if (p1moves > p2moves && player == 1) {
    return false;
  } else if (p2moves > p1moves && player == 2) {
    return false;
  }
  if (p1moves + p2moves >= 9) {
    return false;
  }
  
  
  return true;
}

boolean is3equal(int a, int b, int c) {
  if (a==b && b==c) {
    return true;
  }
  return false;
}

int isGameWon(int[] boardInput) {
  if (is3equal(boardInput[0],boardInput[1],boardInput[2]) && boardInput[0] != 0) {
    //print("a");
    return boardInput[0];
  }
  if (is3equal(boardInput[3],boardInput[4],boardInput[5]) && boardInput[3] != 0) {
    //print("b");
    return boardInput[3];
  }
  if (is3equal(boardInput[6],boardInput[7],boardInput[8]) && boardInput[6] != 0) {
    //print("c");
    return boardInput[6];
  }
  
  if (is3equal(boardInput[0],boardInput[3],boardInput[6]) && boardInput[0] != 0) {
    //print("d");
    return boardInput[0];
  }
  if (is3equal(boardInput[1],boardInput[4],boardInput[7]) && boardInput[1] != 0) {
    //print("e");
    return boardInput[1];
  }
  if (is3equal(boardInput[2],boardInput[5],boardInput[8]) && boardInput[2] != 0) {
    //print("f");
    return boardInput[2];
  }
  
  if (is3equal(boardInput[0],boardInput[4],boardInput[8]) && boardInput[0] != 0) {
    //print("g");
    return boardInput[0];
  }
  if (is3equal(boardInput[2],boardInput[4],boardInput[6]) && boardInput[2] != 0) {
    //print("h");
    return boardInput[2];
  }
  return 0;
}
