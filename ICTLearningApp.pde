import cassette.audiofiles.*;

int devCounter = 0;

boolean wipeData = false;
boolean isHomepage;
boolean display;
boolean restartFlag = false;

ArrayList<Page> pages;

PApplet applet = this;

PImage audioImg;
PImage inProgressImg;
PImage finishedImg;

void setup() {
  size(displayWidth, displayHeight);
  init();
}

void draw() {
  if (restartFlag) {
    display = false;
    disposePages();
    init();
    display = true;
    restartFlag = false;
    wipeData = false;
  }
  
  background(255);
  if (mousePressed && isHomepage && millis() < 2500) devCounter++;
  if (devCounter > 50 && isHomepage && millis() < 2500) {
    wipeData = true;
    background(0);
    restart();
  } else {
    displayPages();
  }
}

void init() {
  isHomepage = true;
  textAlign(LEFT, TOP);
  audioImg = loadImage("Audio.png");
  inProgressImg = loadImage("InProgress.png");
  finishedImg = loadImage("Finished.png");
  pages = new ArrayList();
  
  pages.add(new HomePage());
}

void displayPages() {
  for (Page p : pages) {
    p.displayIfShown();
  }
}

void disposePages() {
  for (Page p : pages) {
    p.dispose();
  }
  
  pages.clear();
}

void pause() {
  restart();
}

void restart() {
  restartFlag = true;
}

void onBackPressed() {
  if (isHomepage) {
    exit();
  } else {
    restart();
  }
}
