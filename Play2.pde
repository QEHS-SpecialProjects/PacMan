void Play2 () {
  if (Play2) {
    Play=false;
    background(0);
    stroke(0);
    fill(255);
    textSize(20);
    text("Lives "+lives, width-width+5, height-5);
    if (PointsArr.size()<=0) {
      Win=true;
    }

    textSize(30);
    fill(0, 255, 0);
    text(Score1, width-width+10, height-height+30);

    fill(255, 0, 0);
    text(Score2, width-75, height-height+30);
    Ghost();
    Ghost2();
    fill(255);
    text((timing - floor(gameStep/60)), width/2-25, height-height+30);
    for (int i = LineArr.size()-1; i >= 0; i--) {
      Line getLine = LineArr.get(i);
      getLine.step();
    }

    for (int i = GhostLineArr.size()-1; i >= 0; i--) {
      LineGhost getLineGhost = GhostLineArr.get(i);
      getLineGhost.step();
    }

    for (int i = PointsArr.size()-1; i >= 0; i--) {
      Points getPoints = PointsArr.get(i);
      getPoints.step();
      boolean alive = getPoints.touched();
      if (alive) {
        PointsArr.remove(i);
      }
    }

    move = 2;
    move2 = 2;
    
    
    fill(0,255,0);
    ellipse(Px, Py, Ps, Ps);//PLAYER 1


    /*----------------------------------*/


    if (Px<width-width) {
      Px=width;
      Py=240;
    }
    if (Px>width) {
      Px=width-width;
      Py=240;
    }
    if (Py<height-height) {
      Py=height;
    }
    if (Py>height) {
      Py=height-height;
    }

    /*---------------------------------------------------*/

    if (P2x<width-width) {
      P2x=width;
      P2y=240;
    }
    if (P2x>width) {
      P2x=width-width;
      P2y=240;
    }
    if (P2y<height-height) {
      P2y=height;
    }
    if (P2y>height) {
      P2y=height-height;
    }
    




    if (wKey) {
      go = true;
      for (int i = LineArr.size()-1; i >= 0; i--) {
        Line getLine = LineArr.get(i);
        if (!getLine.StopBall("Up", Px, Py, Ps/2)) {
          go = false;
        }
      }

      for (int i = GhostLineArr.size()-1; i >= 0; i--) {
        LineGhost getLineGhost = GhostLineArr.get(i);
        if (!getLineGhost.StopBall("Up", Px, Py, Ps/2)) {
          go = false;
        }
      }

      if (go) {
        Py=Py-move;
      }
      go = false;
    }




    if (sKey) {
      go = true;
      for (int i = LineArr.size()-1; i >= 0; i--) {
        Line getLine = LineArr.get(i);
        if (!getLine.StopBall("Down", Px, Py, Ps/2)) {
          go = false;
        }
      }
      
      
      for (int i = GhostLineArr.size()-1; i >= 0; i--) {
        LineGhost getLineGhost = GhostLineArr.get(i);
        if (!getLineGhost.StopBall("Down", Px, Py, Ps/2)) {
          go = false;
        }
      }
      
      
      if (go) {
        Py=Py+move;
      }
      go = false;
    }
    if (aKey) {
      go = true;
      for (int i = LineArr.size()-1; i >= 0; i--) {
        Line getLine = LineArr.get(i);
        if (!getLine.StopBall("Left", Px, Py, Ps/2)) {
          go = false;
        }
      }
      
      for (int i = GhostLineArr.size()-1; i >= 0; i--) {
        LineGhost getLineGhost = GhostLineArr.get(i);
        if (!getLineGhost.StopBall("Left", Px, Py, Ps/2)) {
          go = false;
        }
      }
      
      if (go) {
        Px=Px-move;
      }
      go = false;
    }
    if (dKey) {
      go = true;
      for (int i = LineArr.size()-1; i >= 0; i--) {
        Line getLine = LineArr.get(i);
        if (!getLine.StopBall("Right", Px, Py, Ps/2)) {
          go = false;
        }
      }
      
      for (int i = GhostLineArr.size()-1; i >= 0; i--) {
        LineGhost getLineGhost = GhostLineArr.get(i);
        if (!getLineGhost.StopBall("Right", Px, Py, Ps/2)) {
          go = false;
        }
      }
      
      
      if (go) {
        Px=Px+move;
      }
      go = false;
    }
  }
  

}
  
