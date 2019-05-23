boolean inCircle(int a, int b, int c, int d, int radius) {
  int xAxis = 0;
  int yAxis = 0;
  if (a > c) {
    xAxis = a - c;
  } else {
    xAxis = c - a;
  }
  if (b > d) {
    yAxis = b - d;
  } else {
    yAxis = d - b;
  }
  if (sqrt(xAxis*xAxis + yAxis*yAxis) <= radius) {
    return true;
  }
  return false;
}
