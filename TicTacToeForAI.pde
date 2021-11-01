/*

Global vars:
NeuralNetwork[] trainingAiArray = new NeuralNetwork[100]
NeuralNetwork[] bestAIs = new NeuralNetwork[5000]
int[] trainingAiScores = new int[100]

AI training:

100 ais are created, each plays 10 games with random ais, ais who lost more than 5 are deleted, rest are duplicated and randomized
Random ai from each round is stored to be played against


Each cycle, the best ai is stored and a minigame is created which loads the ai for the programmer to play against it


*/

/*
ai minigame:
When currentPlayer is 1, we wait for mouseClicked to call when the player is clicking on a box, then check if the move is allowed, we increment the board, we check if the game is won and display text if so,
and 



ai slider button:
Every loop, MousePressed checks to see if the mouse is pressed on the button, and mouseReleased checks if mouse has been released from the button. Both set isClickedOnBox
If isClickedOnBox is true, we set the color to red, we move the box to wherever the player moves the mouse, and when the player drops it, we record the new position and find the nearest ai.




*/


int[] layerSizes = {9, 9, 9, 9};
NeuralNetwork[] trainingAiArray = new NeuralNetwork[100];
NeuralNetwork[] newAiArray = new NeuralNetwork[100];
int round = 1;
NeuralNetwork[] bestAis = new NeuralNetwork[1000];

float locOfSliderBox = 0;
int currentPlayingAI = 0;
int[] currentPlayingBoard = {0,0,0,0,0,0,0,0,0,0};
int currentPlayer = 1;
int whereIsMouse = 0; //1 for on board, 2 for on slider, 0 for neither
boolean isClickedOnBox = false;

void setup() {
  size(600,800);
  for (int i = 0; i < 100; i++) {
    trainingAiArray[i] = new NeuralNetwork(layerSizes);
  }
  
  
  //print(playOneTicTacToeGame(trainingAiArray[0], trainingAiArray[1]));
  
  
  
}


void draw() {
  
  newAiArray = RunOneTestStyle1(trainingAiArray, layerSizes);
  
  for (int i = 0; i < trainingAiArray.length; i++) {
    trainingAiArray[i] = newAiArray[i].deepCopy(layerSizes);
  }
  
  newAiArray = new NeuralNetwork[trainingAiArray.length];
  
  bestAis[round-1] = trainingAiArray[trainingAiArray.length-1].deepCopy(layerSizes);
  round++;
  println(round);
  
  if (mousePressed) {
    if (whereDidPlayerClick(mouseX,  mouseY, (int) floor(100+(locOfSliderBox*400)), 700) == 9) {
      isClickedOnBox = true;
      locOfSliderBox = (float) (mouseX-100)/400;
      if (locOfSliderBox > 1) {
        locOfSliderBox = 1;
      }
      if (locOfSliderBox < 0) {
        locOfSliderBox = 0;
      }
      currentPlayingAI = floor((float)locOfSliderBox*(float)round);
      for (int i = 0; i < 9; i++) {
        currentPlayingBoard[i] = 0;
      }
    }
  }
  
  if (currentPlayer == 2 && isGameWon(currentPlayingBoard) == 0) {
    currentPlayingBoard[aiBestMove(currentPlayingBoard, aiBestMoves(bestAis[currentPlayingAI], 2, currentPlayingBoard), 2)-1] = 2;
    currentPlayer = 1;
  }
  
  
  
  drawTicTacToe(currentPlayingBoard, locOfSliderBox, currentPlayingAI, isClickedOnBox);
  
  
}

void mousePressed() {
  int x = mouseX;
  int y = mouseY;
  int playerClick = whereDidPlayerClick(x, y, (int) floor(100+(locOfSliderBox*400)), 700);
  
  if (playerClick <= 9 && currentPlayer == 1 && isGameWon(currentPlayingBoard) == 0) {
    if (IsMoveAllowed(currentPlayingBoard, currentPlayer, playerClick+1)) {
      currentPlayingBoard[playerClick] = 1;
      currentPlayer = 2;
    }
  }
  
  if (playerClick == 9) {
    isClickedOnBox = true;
  }
  print(playerClick, currentPlayer);
}

void mouseReleased() {
  
  isClickedOnBox = false;
  
  
}
