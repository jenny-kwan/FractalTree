private double fractionLength = 0.78;  
private int smallestBranch = 12;  
private double branchAngle = 0.28;   

public void setup() {    
    size(640, 480);    
    background(220, 240, 255);
    noLoop();  
}  

public void draw() {    
    stroke(153, 102, 51);
    strokeWeight(4);  
    line(320, 480, 320, 380);    
    drawBranches(320, 380, 100, 3 * Math.PI / 2);   
}  

public void drawBranches(int x, int y, double branchLength, double angle) {    
    if (branchLength > smallestBranch) {  
        double angle1 = angle + branchAngle;  
        double angle2 = angle - branchAngle;  

        branchLength *= fractionLength;  

        int endX1 = (int) (branchLength * Math.cos(angle1) + x);  
        int endY1 = (int) (branchLength * Math.sin(angle1) + y);  
        int endX2 = (int) (branchLength * Math.cos(angle2) + x);  
        int endY2 = (int) (branchLength * Math.sin(angle2) + y);  

        stroke(153, 102, 51);  
        strokeWeight((float) (branchLength / 10));  
        line(x, y, endX1, endY1);  
        line(x, y, endX2, endY2);  

        drawBranches(endX1, endY1, branchLength, angle1);  
        drawBranches(endX2, endY2, branchLength, angle2);  

        if (branchLength < 18) {  
            drawCuteFlower(endX1, endY1);  
            drawCuteFlower(endX2, endY2);  
        }  
    }  
}    

public void drawCuteFlower(int x, int y) {  
    fill(255, 210, 225, 180);
    noStroke();  

    ellipse(x + 4, y, 7, 7);  
    ellipse(x - 4, y, 7, 7);  
    ellipse(x, y - 4, 7, 7);  
    ellipse(x, y + 4, 7, 7);  

    fill(255, 235, 240);
    ellipse(x, y, 6, 6);  
}
