public class DisplayStats {
  
  int shotClock;
  int gameClock;
  int period;
  boolean isDispPlayer;
  Player dispPlayer;
  String homeTeam;
  String visitorTeam;
  String url;
  
  PFont hightech; // Digital Clock Font
  
  PImage webImg;
  
  int sec;
  int minutes;
  
  float gameClockX1;
  float gameClockX2;
  
  public DisplayStats(){ // constructor
  url = "http://i.cdn.turner.com/nba/nba/.element/img/2.0/sect/statscube/players/large/";
  hightech = loadFont("fonts/LCD5x8H-48.vlw");
  shotClock = 0;
  gameClock = 0;
  period = 0;
  isDispPlayer = false;
  gameClockX1 = scaleFactor * xOffset + scaleFactor*(1504/2) - 130;
  gameClockX2 = gameClockX1 + 260;
  }
  
  public void update(TableRow row) {
    shotClock = (int) Math.ceil(row.getFloat(SHOTCLOCK));
    gameClock = (int) Math.ceil(row.getFloat(GAMECLOCK));
    period = row.getInt(PERIOD);
    sec = gameClock % 60;
    minutes = gameClock / 60;
  }
  
  public void draw() {
    drawGameClock();
    if(isDispPlayer){
      imageMode(CORNERS);
      image(webImg, 75, 600);
      textAlign(CENTER,TOP);
      textFont(vsFont,32);
      fill(0);
      text(dispPlayer.jerseynumber+"  "+dispPlayer.firstname+" "+dispPlayer.lastname+",  "+dispPlayer.position, 190, 795);
      fill(0,60);
      strokeWeight(1);
      stroke(255);
      ellipse(scaleFactor*(dispPlayer.xpos*16 + xOffset), scaleFactor*(dispPlayer.ypos*16 + yOffset), scaleFactor*(40), scaleFactor*(40));
      stroke(dispPlayer.strokeColor);
      strokeWeight(scaleFactor*(5));
      fill(dispPlayer.dispColor);
      ellipse(scaleFactor*(dispPlayer.xpos*16 + xOffset), scaleFactor*(dispPlayer.ypos*16 + yOffset), scaleFactor*(20), scaleFactor*(20));
      
      //Show total traveled distance
      textAlign(LEFT,TOP);
      textFont(vsFont,24);
      fill(0);
      //String.format("%.3f%n", dispPlayer.distanceTraveled.get(moment));
      text("Total Distance Traveled: " + String.format("%.3f", dispPlayer.distanceTraveled.get(moment)), tempXOffset + tempXCenter, tempYOffset + scaleFactor*(800) + 10);
      text(String.format("%63s","ft"), tempXOffset + tempXCenter, tempYOffset + scaleFactor*(800) + 10);
      text("Average Speed: " + String.format("%.3f", dispPlayer.averageSpeed.get(moment)), tempXOffset + tempXCenter, tempYOffset + scaleFactor*(800) + 10 + 24);
      text(String.format("%50s","ft/sec"), tempXOffset + tempXCenter, tempYOffset + scaleFactor*(800) + 10 + 24);
    }
  }
  
  public void setPlayerStats(Player tempPlayer){
    isDispPlayer = true;
    dispPlayer = tempPlayer;
    webImg = loadImage(url + dispPlayer.firstname.toLowerCase().replaceAll("[^\\p{Alpha}]", "") + "_" + dispPlayer.lastname.toLowerCase().replaceAll("[^\\p{Alpha}]", "") + ".png");
  }
  
  public void drawShotClock() {
    fill(0);
    strokeWeight(4);
    stroke(0,69,162);
    quad(scaleFactor * xOffset,20,scaleFactor * xOffset + 128,20,scaleFactor * xOffset + 128,120,scaleFactor * xOffset,120);
  }
  
  public void drawPeriod() {
    fill(0);
    strokeWeight(4);
    stroke(0,69,162);
    //quad(scaleFactor * xOffset+scaleFactor*(1504),20,scaleFactor * xOffset + 128,20,scaleFactor * xOffset - 128 + scaleFactor*(1504),120,scaleFactor * xOffset,120);
    quad(scaleFactor * xOffset+scaleFactor*(1504),20,scaleFactor * xOffset - 128 +scaleFactor*(1504),20,scaleFactor * xOffset - 128 + scaleFactor*(1504),120,scaleFactor * xOffset+scaleFactor*(1504),120);
    textFont(hightech,75);
    fill(#00FF22);
    textAlign(CENTER);
    text(period,scaleFactor * xOffset - 59 +scaleFactor*(1504),98);
  }
  
  public void drawGameClock() {
    drawShotClock();
    drawPeriod();
    fill(0);
    strokeWeight(4);
    stroke(0,69,162);
    quad(gameClockX1,20,gameClockX2,20,gameClockX2,120,gameClockX1,120);

    float clockMid = (gameClockX2 - gameClockX1) / 2;
    fill(#ffe600);
    //noStroke();
    stroke(#ffe600);
    //quad(gameClockX1 + clockMid - 6,55,gameClockX1 + clockMid -3,55,gameClockX1 + clockMid - 3,85,gameClockX1 + clockMid - 6,85);
    //quad(gameClockX1 + clockMid + 6,55,gameClockX1 + clockMid + 3,55,gameClockX1 + clockMid + 3,85,gameClockX1 + clockMid + 6,85);
    quad(gameClockX1 + clockMid - 4,55,gameClockX1 + clockMid - 3,55,gameClockX1 + clockMid - 3,56,gameClockX1 + clockMid - 4,56);
    quad(gameClockX1 + clockMid + 4,84,gameClockX1 + clockMid + 3,84,gameClockX1 + clockMid + 3,85,gameClockX1 + clockMid + 4,85);
    quad(gameClockX1 + clockMid - 4,84,gameClockX1 + clockMid - 3,84,gameClockX1 + clockMid - 3,85,gameClockX1 + clockMid - 4,85);
    quad(gameClockX1 + clockMid + 4,55,gameClockX1 + clockMid + 3,55,gameClockX1 + clockMid + 3,56,gameClockX1 + clockMid + 4,56);
    
    quad(gameClockX1 + clockMid - 4,49,gameClockX1 + clockMid - 3,49,gameClockX1 + clockMid - 3,50,gameClockX1 + clockMid - 4,50);
    quad(gameClockX1 + clockMid + 4,90,gameClockX1 + clockMid + 3,90,gameClockX1 + clockMid + 3,91,gameClockX1 + clockMid + 4,91);
    quad(gameClockX1 + clockMid - 4,90,gameClockX1 + clockMid - 3,90,gameClockX1 + clockMid - 3,91,gameClockX1 + clockMid - 4,91);
    quad(gameClockX1 + clockMid + 4,49,gameClockX1 + clockMid + 3,49,gameClockX1 + clockMid + 3,50,gameClockX1 + clockMid + 4,50);
    
    // game clock
    textFont(hightech,75);
    fill(#ffe600);
    textAlign(CENTER);
    text(sec,gameClockX2 - 60,98);
    
    fill(#ffe600);
    textAlign(CENTER);
    text(minutes,gameClockX2 - 195,98);

    // shot clock
    fill(#ff3d3d);
    textAlign(CENTER);
    text(shotClock,scaleFactor*xOffset + 70,98);
  }
  
}