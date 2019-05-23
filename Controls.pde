void keyUp() {
  wKey = false;
  sKey = false;
  aKey = false;
  dKey = false;
}

void keyUp2() {
  up = false;
  down = false;
  left = false;
  right = false;
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    keyUp();
    wKey = true;
  }
  if (key == 's' || key == 'S') {
    keyUp();
    sKey = true;
  } //Up And Down MoveMents

  if (key == 'a'|| key == 'A') {
    keyUp();
    aKey = true;
  }
  if (key == 'd' || key == 'D') {
    keyUp();
    dKey = true;
  }
  if (key == 'l' || key == 'L') {
    Play2 =true;
  }
  if (key == 'r' || key == 'R') {
      
      Stuck = false;
      GameOver = false;
      Play = false;
      Play2 = false;
      timing = maxTime;
      gameStep = 0;
      Win = false;
      Menu = true;
      wKey = false;
      sKey = false;
      aKey = false;
      dKey = false;
      Px = 186;
      Py = 191;
      lives = 3;

      up = false;
      down = false;
      left = false;
      right = false;
      P2x = 250;
      P2y = 275;
      Score1 = 0;
      Score2 = 0;
      x = 14;
      y = 49;
      x2 = 484;
      y2 = 455;
    }

  

  /*-------------------------------*/


  if (key == CODED) {
    if (keyCode == UP) {
      keyUp2();
      up = true;
      Play = true;
    }
    if (keyCode == DOWN) {
      keyUp2();
      down = true;
      Play = true;
    } //Up And Down MoveMents

    if (keyCode == LEFT) {
      keyUp2();
      left = true;
      Play = true;
    }
    if (keyCode == RIGHT) {
      keyUp2();
      right = true;
      Play = true;
    }
    
  }//Left And Right MoveMents
}
