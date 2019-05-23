class Points {
  private int Width;
  private int Height;
  private int PositionX;
  private int PositionY;
  private boolean show = true;

  public Points(int posX, int posY, int wid, int hei) {
    this.Width = wid;
    this.Height = hei;
    this.PositionX = posX;
    this.PositionY = posY;
  }

  public boolean touched() {
    if (inCircle(Px, Py, PositionX, PositionY, 15)) {
      Score1=Score1+10;
      return true;
    }else { 
      return false;
    }
  }

  void step() {
    if (show) {
      fill(230);
      stroke(0);
      rect(PositionX, PositionY, Width, Height);
    }
  }
}
