/*


TicTacToe game
Player has a slider from 0 to however many ais have been trained
When player moves the slider to some number, board is reset and that ai is loaded
Player goes first, then ai
  


*/



void drawTicTacToe(int[] board, float sliderPercent, int sliderNumber, boolean isOverBox) {
  background(255,255,255);
  
  stroke(0,0,0);
  strokeWeight(10);
  line(10,200,590,200);
  line(10,400,590,400);
  line(200,10,200,590);
  line(400,10,400,590);
  
  for (int i = 0; i < 3; i++) {
    if (board[i] == 1) {
      drawX(200*i, 0);
    }
    if (board[i] == 2) {
      drawO(200*i, 0);
    }
  }
  for (int i = 3; i < 6; i++) {
    if (board[i] == 1) {
      drawX(200*i - 600, 200);
    }
    if (board[i] == 2) {
      drawO(200*i - 600, 200);
    }
  }
  for (int i = 6; i < 9; i++) {
    if (board[i] == 1) {
      drawX(200*i - 1200, 400);
    }
    if (board[i] == 2) {
      drawO(200*i - 1200, 400);
    }
  }
  
  stroke(128,128,128);
  line(100, 700, 500, 700);
  
  rectMode(CENTER);
  stroke(0,0,0);
  if (isOverBox) {
    stroke(255,0,0);
  }
  rect(100+(sliderPercent*400), 700, 100, 100);
  fill(0,0,0);
  textSize(50);
  textAlign(CENTER, CENTER);
  text(sliderNumber, 100+(sliderPercent*400), 693);
  fill(255,255,255);
  
}


void drawX(int x, int y) {
  strokeWeight(10);
  line(x, y, x+200, y+200);
  line(x, y+200, x+200, y);
}

void drawO(int x, int y) {
  strokeWeight(10);
  ellipse(x+100,y+100,200,200);
}


int whereDidPlayerClick(int x, int y, int x2, int y2) {
  if (y < 200 && x < 200) {
    return 0;
  } else if (y < 200 && x < 400) {
    return 1;
  } else if (y < 200 && x < 600) {
    return 2;
  } else if (y < 400 && x < 200) {
    return 3;
  } else if (y < 400 && x < 400) {
    return 4;
  } else if (y < 400 && x < 600) {
    return 5;
  } else if (y < 600 && x < 200) {
    return 6;
  } else if (y < 600 && x < 400) {
    return 7;
  } else if (y < 600 && x < 600) {
    return 8;
  }
  if (x < x2+100 && x > x2-100 && y < y2+100 && y > y2-100) {
    return 9;
  }
  
  return 20;
}
