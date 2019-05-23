void Ghost2() {
  boolean Left = false;
  boolean Right = false;
  boolean Up = false;
  boolean Down = false;
  
  boolean Left2 = false;
  boolean Right2 = false;
  boolean Up2 = false;
  boolean Down2 = false;
  
  int iX2 = x2;
  int iY2 = y2;
  int tempA2 = 0;
  
  
  boolean go3 = false;
  
  moveG2=1;
  fill(255, 0, 255);
  //ellipse(Gx, Gy, Gs, Gs);
  

float easing = 0.05;



  
  int targetX = Px;
  int dx = targetX - x;
  
  int targetY = Py;
  int dy = targetY - y;
  
  ellipse(x2, y2, Gs2, Gs2);

  if (!Stuck2) {
    if (x2 >= Px) {
      Left = true;
    }
    if (x2 <= Px) {
      Right = true;
    }
    if (y2 >= Py) {
      Up = true;
    }
    if (y2 <= Py) {
      Down = true;
    }
  } else {
    if (HorizontalDir2 == "" && VerticalDir2 == "") {
      tempA2 = ceil(random(4));
      if (tempA2 == 1) {
        HorizontalDir2 = "Right";
      } else if (tempA2 == 2) {
        HorizontalDir2 = "Left";
      }
      if (tempA2 == 3) {
        VerticalDir2 = "Up";
      } else if (tempA2 == 4) {
        VerticalDir2 = "Down";
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
    print(HorizontalDir2);
    print(VerticalDir2);
    if (HorizontalDir2 == "Right") {
      go3 = true;
      for (int i = LineArr.size()-1; i >= 0; i--) {
        Line getLine = LineArr.get(i);
        if (!getLine.StopBallGhost("Right", x2, y2, Gs2/2)) {
          go3 = false;
        }
      }
      if (go3) {
        x2=x2+moveG2;
      } else {
        VerticalDir2 = "";
        HorizontalDir2 = "";
        Stuck2 = false;
        iX2 = -100;
        iY2 = -100;
      }
    }
    if (HorizontalDir2 == "Left") {
      go3 = true;
      for (int i = LineArr.size()-1; i >= 0; i--) {
        Line getLine = LineArr.get(i);
        if (!getLine.StopBallGhost("Left", x2, y2, Gs2/2)) {
          go3 = false;
        }
      }
      if (go3) {
        x2=x2-moveG2;
      } else {
        VerticalDir2 = "";
        HorizontalDir2 = "";
        Stuck2 = false;
        iX2 = -100;
        iY2 = -100;
      }
    }
    if (VerticalDir2 == "Up") {
      go3 = true;
      for (int i = LineArr.size()-1; i >= 0; i--) {
        Line getLine = LineArr.get(i);
        if (!getLine.StopBallGhost("Up", x2, y2, Gs2/2)) {
          go3 = false;
        }
      }
      if (go3) {
        y2=y2-moveG2;
      } else {
        VerticalDir2 = "";
        HorizontalDir2 = "";
        Stuck2 = false;
        iX2 = -100;
        iY2 = -100;
      }
    }
    if (VerticalDir2 == "Down") {
      go3 = true;
      for (int i = LineArr.size()-1; i >= 0; i--) {
        Line getLine = LineArr.get(i);
        if (!getLine.StopBallGhost("Down", x2, y2, Gs2/2)) {
          go3 = false;
        }
      }
      if (go3) {
        y2=y2+moveG2;
      } else {
        VerticalDir2 = "";
        HorizontalDir2 = "";
        Stuck2 = false;
        iX2 = -100;
        iY2 = -100;
      }
    }
  }
  
  
  if (Up || Up2) {
    go3 = true;
    for (int i = LineArr.size()-1; i >= 0; i--) {
      Line getLine = LineArr.get(i);
      if (!getLine.StopBallGhost("Up", x2, y2, Gs2/2)) {
        go3 = false;
      }
    }
    if (go3) {
      y2=y2-moveG2;
    }
    go3 = false;
  }
  if (Down || Down2) {
    go3 = true;
    for (int i = LineArr.size()-1; i >= 0; i--) {
      Line getLine = LineArr.get(i);
      if (!getLine.StopBallGhost("Down", x2, y2, Gs2/2)) {
        go3 = false;
      }
    }
    if (go3) {
      y2=y2+moveG2;
    }
    go3 = false;
  }
  if (Left || Left2) {
    go3 = true;
    for (int i = LineArr.size()-1; i >= 0; i--) {
      Line getLine = LineArr.get(i);
      if (!getLine.StopBallGhost("Left", x2, y2, Gs2/2)) {
        go3 = false;
      }
    }
    if (go3) {
      x2=x2-moveG2;
    }
    go3 = false;
  }
  if (Right || Right2) {
    go3 = true;
    for (int i = LineArr.size()-1; i >= 0; i--) {
      Line getLine = LineArr.get(i);
      if (!getLine.StopBallGhost("Right", x2, y2, Gs2/2)) {
        go3 = false;
      }
    }
    if (go3) {
      x2=x2+moveG2;
    }
    go3 = false;
  }
  if (iX2 == x2 && iY2 == y2) {
    Stuck2 = true;
    print("I'm Stuck");
  }
  
  
  if (inCircle(x2, y2, Px, Py, 20)) {
    lives=lives-1;
    x2 = 250;
    y2 = 275;
    x = 250;
    y = 275;
  }
  
    

    if (x2<width-width) {
      x2=width;
      y2=240;
    }
    if (x2>width) {
      x2=width-width;
      y2=240;
    }
}
