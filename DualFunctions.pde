


NeuralNetwork[] RunOneTestStyle1(NeuralNetwork[] ais, int[] sizesOfLayers) {
  //Create scores array
  //Add one to each for a win
  float[] scores = new float[ais.length];
  int result = 0;
  for (int i = 0; i < ais.length; i++) {//iterates player 1
    for (int j = 1; j < ais.length-i; j++) { //iterates player 2
      result = playOneTicTacToeGame(ais[i], ais[j]);
      if (result == 1) {
        scores[i]++;
      }
      if (result == 2) {
        scores[j]++;
      }
    }
  }
  NeuralNetwork[] sortedAis = new NeuralNetwork[ais.length];
  sortedAis = NeuralNetworkSelectionSortArrayLists(ais, scores);
  NeuralNetwork[] bestAis = new NeuralNetwork[10];
  for (int i = 0; i < 10; i++) {
    bestAis[i] = sortedAis[ais.length-10+i];
  }
  NeuralNetwork[] newAis = new NeuralNetwork[ais.length];
  for (int i = 0; i < (ais.length-10); i++) {
    int bestAisIndex = floor(i/((ais.length-10)/10));
    newAis[i] = bestAis[bestAisIndex].deepCopy(sizesOfLayers);
    newAis[i].RandomizeSlightly(.2,.2);
  }
  for (int i = 0; i < 10; i++) {
    newAis[ais.length-i-1] = bestAis[9-i];
  }
  
  return newAis;
  
};




void boardPrinter(int[] board) {
  for (int i = 0; i < 3; i++) {
    print(board[i]);
  }
  println();
  for (int i = 3; i < 6; i++) {
    print(board[i]);
  }
  println();
  for (int i = 6; i < 9; i++) {
    print(board[i]);
  }
  println();
  println();
}

/*
int[] BoardPrintingGame(NeuralNetwork ai1, NeuralNetwork ai2) {
  
  int playerTurn = 1;
  int isWon = 0;
  int turnNumber = 1;
  int[] board = {0,0,0,0,0,0,0,0,0};
  
  //First turn
  board[aiBestMove(board, aiBestMoves(ai1, playerTurn, board), playerTurn)-1] = playerTurn;
  playerTurn = 2; turnNumber++;
  boardPrinter(board);
  
  //Second turn
  board[aiBestMove(board, aiBestMoves(ai2, playerTurn, board), playerTurn)-1] = playerTurn;
  playerTurn = 1; turnNumber++;
  boardPrinter(board);
  
  //Third turn
  board[aiBestMove(board, aiBestMoves(ai1, playerTurn, board), playerTurn)-1] = playerTurn;
  playerTurn = 2; turnNumber++;
  boardPrinter(board);
  
  //Fourth turn
  board[aiBestMove(board, aiBestMoves(ai2, playerTurn, board), playerTurn)-1] = playerTurn;
  playerTurn = 1; turnNumber++;
  boardPrinter(board);
  
  board[aiBestMove(board, aiBestMoves(ai1, playerTurn, board), playerTurn)-1] = playerTurn;
  playerTurn = 2; turnNumber++;
  boardPrinter(board);
  
  board[aiBestMove(board, aiBestMoves(ai2, playerTurn, board), playerTurn)-1] = playerTurn;
  playerTurn = 1; turnNumber++;
  boardPrinter(board);
  
  board[aiBestMove(board, aiBestMoves(ai1, playerTurn, board), playerTurn)-1] = playerTurn;
  playerTurn = 2; turnNumber++;
  boardPrinter(board);
  
  board[aiBestMove(board, aiBestMoves(ai2, playerTurn, board), playerTurn)-1] = playerTurn;
  playerTurn = 1; turnNumber++;
  boardPrinter(board);
  
  board[aiBestMove(board, aiBestMoves(ai1, playerTurn, board), playerTurn)-1] = playerTurn;
  playerTurn = 2; turnNumber++;
  boardPrinter(board);
  
  if (isGameWon(board) == 3) {
    return board;
  } else {
    print("playOneTicTacToeGameError1 ");
    return board;
  }
  
}
*/






int playOneTicTacToeGame(NeuralNetwork ai1, NeuralNetwork ai2) {
  
  int playerTurn = 1;
  int isWon = 0;
  int turnNumber = 1;
  int[] board = {0,0,0,0,0,0,0,0,0};
  
  //First turn
  board[aiBestMove(board, aiBestMoves(ai1, playerTurn, board), playerTurn)-1] = playerTurn;
  playerTurn = 2; turnNumber++;
  
  //Second turn
  board[aiBestMove(board, aiBestMoves(ai2, playerTurn, board), playerTurn)-1] = playerTurn;
  playerTurn = 1; turnNumber++;
  
  
  
  
  //Third turn
  board[aiBestMove(board, aiBestMoves(ai1, playerTurn, board), playerTurn)-1] = playerTurn;
  playerTurn = 2; turnNumber++;
  if (isGameWon(board) != 0) {
    return isGameWon(board);
  }
  
  //Fourth turn
  board[aiBestMove(board, aiBestMoves(ai2, playerTurn, board), playerTurn)-1] = playerTurn;
  playerTurn = 1; turnNumber++;
  if (isGameWon(board) != 0) {
    return isGameWon(board);
  }
  
  
  
  
  board[aiBestMove(board, aiBestMoves(ai1, playerTurn, board), playerTurn)-1] = playerTurn;
  playerTurn = 2; turnNumber++;
  if (isGameWon(board) != 0) {
    return isGameWon(board);
  }
  
  board[aiBestMove(board, aiBestMoves(ai2, playerTurn, board), playerTurn)-1] = playerTurn;
  playerTurn = 1; turnNumber++;
  if (isGameWon(board) != 0) {
    return isGameWon(board);
  }
  
  
  
  
  board[aiBestMove(board, aiBestMoves(ai1, playerTurn, board), playerTurn)-1] = playerTurn;
  playerTurn = 2; turnNumber++;
  if (isGameWon(board) != 0) {
    return isGameWon(board);
  }
  
  board[aiBestMove(board, aiBestMoves(ai2, playerTurn, board), playerTurn)-1] = playerTurn;
  playerTurn = 1; turnNumber++;
  if (isGameWon(board) != 0) {
    return isGameWon(board);
  }
  
  
  
  
  board[aiBestMove(board, aiBestMoves(ai1, playerTurn, board), playerTurn)-1] = playerTurn;
  playerTurn = 2; turnNumber++;
  if (isGameWon(board) != 0) {
    return isGameWon(board);
  }
  
  if (isGameWon(board) == 0) {
    return 3;
  } else {
    print("playOneTicTacToeGameError1 ");
    return 3;
  }
  
}

int flipPlayer(int player) {
  if (player == 1) {
    return 2;
  } else {
    return 1;
  }
}

int[] aiBestMoves(NeuralNetwork ai, int player, int[] boardInput) {
  
  float[] boardCalcInput = new float[9];
  for (int i = 0; i < 9; i++) {
    if (boardInput[i] == player) {
      boardCalcInput[i] = 1;
    } else if (boardInput[i] == flipPlayer(player)) {
      boardCalcInput[i] = .5;
    } else {
      boardCalcInput[i] = 0;
    }
    
  }
  int[] aimovesintarray = {1,2,3,4,5,6,7,8,9}; 
  FloatList aiResult = new FloatList(ai.CalculateValues(boardCalcInput));
  IntList aimoves = new IntList(aimovesintarray);
  int[] bestMoves = new int[9];
  for (int i = 0; i < 9; i++) { //iterate sorting states
    float highestScore = 0;
    int correspondingMove = 1;
    int bestElementIndex = 0;
    for (int j = 0; j < 9-i; j++) { //iterate elements in sorting state
      //Add rest of selection sort code
      if (highestScore < aiResult.get(j)) {
        highestScore = aiResult.get(j);
        bestElementIndex = j;
      }
    }
    
    //add best move to return array, and remove corresponding airesult and aimoves entry
    
    bestMoves[i] = aimoves.get(bestElementIndex);
      
    aimoves.remove(bestElementIndex); //remove network and score from their unsorted arrays
    aiResult.remove(bestElementIndex);
    
    highestScore = 0; //reset lowestCurrentScore
    
    
  }
  return bestMoves;
  
}

int aiBestMove(int[] board, int[] aiBestMoves, int player) {
  
  for (int i = 0; i < 9; i++) {
    if (IsMoveAllowed(board, player, aiBestMoves[i])) {
      return aiBestMoves[i];
    }
  }
  return -1;
}
