class LineGhost {
  private int Width;
  private int Height;
  private int PositionX;
  private int PositionY;

  public LineGhost(int wid, int hei, int posX, int posY) {
    this.Width = wid;
    this.Height = hei;
    this.PositionX = posX;
    this.PositionY = posY;
  }

  boolean StopBall(String ballDirection, int ballX, int ballY, int ballRadius) {
    if (ballDirection == "Up") {
      if (ballX+ballRadius/2<PositionX || ballX-ballRadius/2>PositionX+Width || ballY-ballRadius>PositionY+Height) {
        return true;
      } else if (ballY+ballRadius<PositionY+Height) {
        return true;
      }
    } else if (ballDirection == "Down") {
      if (ballX+ballRadius/2<PositionX || ballX-ballRadius/2>PositionX+Width || ballY+ballRadius<PositionY) {
        return true;
      } else if (ballY-ballRadius>PositionY) {
        return true;
      }
    } else if (ballDirection == "Left") {
      if (ballY+ballRadius/2<PositionY || ballY-ballRadius/2>PositionY+Height || ballX-ballRadius>PositionX+Width) {
        return true;
      } else if (ballX+ballRadius<PositionX+Width) {
        return true;
      }
    } else if (ballDirection == "Right") {
      if (ballY+ballRadius/2<PositionY || ballY-ballRadius/2>PositionY+Height || ballX+ballRadius<PositionX) {
        return true;
      } else if (ballX-ballRadius>PositionX) {
        return true;
      }
    }
    return false;
  }

  void step() {
    stroke(#00ACFF);
    fill(0);
    rect(PositionX, PositionY, Width, Height);
  }
}
