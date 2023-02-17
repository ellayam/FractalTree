private double fractionLength = .8;
private int smallestBranch = 12;
private double branchAngle = .4;

public void setup() {
  size(700,500);
  noLoop();
}

public void draw() {
  background(203,237,255);
  noStroke();
  fill(14,100,20);
  rect(0,440,700,60);
  stroke(126,117,92);
  strokeWeight(6);
  line(350,480,350,380);
  strokeWeight(4);
  drawBranches(350,380,100,3*Math.PI/2); 
}

public void drawBranches(int x,int y, double branchLength, double angle) {
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength *= fractionLength;
  if(branchLength < 80) {
    stroke((int)(Math.random()*100)+100,(int)(Math.random()*100)+100,(int)(Math.random()*100)+100);
    strokeWeight(3);
  }
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);
  
  if(branchLength > smallestBranch) {
    drawBranches(endX1,endY1,branchLength,angle1);
    drawBranches(endX2,endY2,branchLength,angle2);
  }
}
