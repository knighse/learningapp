import cassette.audiofiles.*;
import android.preference.PreferenceManager;
import android.content.SharedPreferences;
import java.util.Arrays;

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
PImage rocket;

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
    devCounter = 0;
  }
  
  background(255);
  if (mousePressed && isHomepage && millis() < 2500) devCounter++;
  if (!mousePressed && devCounter > 0) devCounter = 0;
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
  audioImg = loadImage("Audio.png");
  inProgressImg = loadImage("InProgress.png");
  finishedImg = loadImage("Finished.png");
  rocket = loadImage("rocket.png");
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

void roundRect(float x, float y, float w, float h, float r) {
  noStroke();
  rectMode(CORNER);
  
  float  ax, ay, hr;
  
  ax=x+w-1;
  ay=y+h-1;
  hr = r/2;
  
  rect(x, y, w, h);
  arc(x, y, r, r, radians(180.0), radians(270.0));
  arc(ax, y, r,r, radians(270.0), radians(360.0));
  arc(x, ay, r,r, radians(90.0), radians(180.0));
  arc(ax, ay, r,r, radians(0.0), radians(90.0));
  rect(x, y-hr, w, hr);
  rect(x-hr, y, hr, h);
  rect(x, y+h, w, hr);
  rect(x+w,y,hr, h);
}
