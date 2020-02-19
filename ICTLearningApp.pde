import cassette.audiofiles.*;

boolean isHomepage;
boolean display;

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
  background(255);
  displayPages();
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
  display = false;
  disposePages();
  init();
  display = true;
}

void onBackPressed() {
  if (isHomepage) {
    exit();
  } else {
    display = false;
    disposePages();
    init();
    display = true;
  }
}
