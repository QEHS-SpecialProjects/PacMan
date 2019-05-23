void Ghost() {
  boolean Left = false;
  boolean Right = false;
  boolean Up = false;
  boolean Down = false;
  
  boolean Left2 = false;
  boolean Right2 = false;
  boolean Up2 = false;
  boolean Down2 = false;
  
  int iX = x;
  int iY = y;
  int tempA = 0;
  
  
  boolean go3 = false;
  
  moveG=1;
  fill(0, 0, 255);
  //ellipse(Gx, Gy, Gs, Gs);
  

float easing = 0.05;



  
  int targetX = Px;
  int dx = targetX - x;
  
  int targetY = Py;
  int dy = targetY - y;
  
  ellipse(x, y, Gs, Gs);

  if (!Stuck) {
    if (x >= Px) {
      Left = true;
    }
    if (x <= Px) {
      Right = true;
    }
    if (y >= Py) {
      Up = true;
    }
    if (y <= Py) {
      Down = true;
    }
  } else {
    if (HorizontalDir == "" && VerticalDir == "") {
      tempA = ceil(random(4));
      if (tempA == 1) {
        HorizontalDir = "Right";
      } else if (tempA == 2) {
        HorizontalDir = "Left";
      }
      if (tempA == 3) {
        VerticalDir = "Up";
      } else if (tempA == 4) {
        VerticalDir = "Down";
      }
    }
    /*if (VerticalDir == "") {
      tempA = ceil(random(2));;
      if (tempA == 1) {
        VerticalDir = "Up";
      } else if (tempA == 2) {
        VerticalDir = "Down";
      }
    }*/
    print(HorizontalDir);
    print(VerticalDir);
    if (HorizontalDir == "Right") {
      go3 = true;
      for (int i = LineArr.size()-1; i >= 0; i--) {
        Line getLine = LineArr.get(i);
        if (!getLine.StopBallGhost("Right", x, y, Gs/2)) {
          go3 = false;
        }
      }
      if (go3) {
        x=x+moveG;
      } else {
        VerticalDir = "";
        HorizontalDir = "";
        Stuck = false;
        iX = -100;
        iY = -100;
      }
    }
    if (HorizontalDir == "Left") {
      go3 = true;
      for (int i = LineArr.size()-1; i >= 0; i--) {
        Line getLine = LineArr.get(i);
        if (!getLine.StopBallGhost("Left", x, y, Gs/2)) {
          go3 = false;
        }
      }
      if (go3) {
        x=x-moveG;
      } else {
        VerticalDir = "";
        HorizontalDir = "";
        Stuck = false;
        iX = -100;
        iY = -100;
      }
    }
    if (VerticalDir == "Up") {
      go3 = true;
      for (int i = LineArr.size()-1; i >= 0; i--) {
        Line getLine = LineArr.get(i);
        if (!getLine.StopBallGhost("Up", x, y, Gs/2)) {
          go3 = false;
        }
      }
      if (go3) {
        y=y-moveG;
      } else {
        VerticalDir = "";
        HorizontalDir = "";
        Stuck = false;
        iX = -100;
        iY = -100;
      }
    }
    if (VerticalDir == "Down") {
      go3 = true;
      for (int i = LineArr.size()-1; i >= 0; i--) {
        Line getLine = LineArr.get(i);
        if (!getLine.StopBallGhost("Down", x, y, Gs/2)) {
          go3 = false;
        }
      }
      if (go3) {
        y=y+moveG;
      } else {
        VerticalDir = "";
        HorizontalDir = "";
        Stuck = false;
        iX = -100;
        iY = -100;
      }
    }
  }
  
  
  if (Up || Up2) {
    go3 = true;
    for (int i = LineArr.size()-1; i >= 0; i--) {
      Line getLine = LineArr.get(i);
      if (!getLine.StopBallGhost("Up", x, y, Gs/2)) {
        go3 = false;
      }
    }
    if (go3) {
      y=y-moveG;
    }
    go3 = false;
  }
  if (Down || Down2) {
    go3 = true;
    for (int i = LineArr.size()-1; i >= 0; i--) {
      Line getLine = LineArr.get(i);
      if (!getLine.StopBallGhost("Down", x, y, Gs/2)) {
        go3 = false;
      }
    }
    if (go3) {
      y=y+moveG;
    }
    go3 = false;
  }
  if (Left || Left2) {
    go3 = true;
    for (int i = LineArr.size()-1; i >= 0; i--) {
      Line getLine = LineArr.get(i);
      if (!getLine.StopBallGhost("Left", x, y, Gs/2)) {
        go3 = false;
      }
    }
    if (go3) {
      x=x-moveG;
    }
    go3 = false;
  }
  if (Right || Right2) {
    go3 = true;
    for (int i = LineArr.size()-1; i >= 0; i--) {
      Line getLine = LineArr.get(i);
      if (!getLine.StopBallGhost("Right", x, y, Gs/2)) {
        go3 = false;
      }
    }
    if (go3) {
      x=x+moveG;
    }
    go3 = false;
  }
  if (iX == x && iY == y) {
    Stuck = true;
    print("I'm Stuck");
  }
  
  
  if (inCircle(x, y, Px, Py, 20)) {
    lives=lives-1;
    x = 250;
    y = 275;
    x2 = 250;
    y2 = 275;
  }
  if (x<width-width) {
      x=width;
      y=240;
    }
    if (x>width) {
      x=width-width;
      y=240;
    }
}
