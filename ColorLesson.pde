class ColorLesson extends Lesson {
  color[] colors = new color[]{color(0, 0, 255), color(0, 255, 0), color(255, 0, 0), color(100, 0, 255), color(255, 255, 0), color(255, 0, 255), color(255, 150, 0)};
  String[] names = new String[]{"Blue", "Green", "Red", "Purple", "Yellow", "Pink", "Orange"};
  //top = 0, middle = 1, bottom = 2
  String nameToGuess;
  color ccorrect;
  int correct = -1;
  color ctop;
  color cmiddle;
  color cbottom;
  PVector top = new PVector(width/2, height/4);
  PVector middle = new PVector(width/2, (height/4)*2);
  PVector bottom = new PVector(width/2, (height/4)*3);
  float radius = 500;
  float hradius = radius/2;
  boolean justPressed = false;
  color flashColor;
  int flashTime = 0;
  
  SoundFile good = new SoundFile(applet, "Good.wav");
  SoundFile bad = new SoundFile(applet, "Bad.wav");
  
  ColorLesson() {
    name = "Colors";
    desc = "Learn your colors with this exciting lesson about colors and their names! Listen to the color's name and tap on which one it is. How many can you get?";
    icon = loadImage("Colors.png");
    soundButton = new SoundButton("Colors.wav");
    
    try {
      if (wipeData) {
        throw new Exception();
      }
      
      SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(getContext());
      progress = preferences.getInt("ColorLesson",-1);
      
      if (progress < 0) {
        throw new Exception();
      }
      
      if (progress > 0) {
        inProgress = true;
      }
      if (progress > 30) {
        finished = true;
      }
    } catch (Exception e) {
      SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(getContext());
      SharedPreferences.Editor editor = preferences.edit();
      editor.putInt("ColorLesson",0);
      editor.commit();
      
      progress = 0;
    }
  }
  
  void display() {
    if (flashTime > 0) {
      background(flashColor);
      flashTime--;
      return;
    }
    
    if (progress >= 30) {
      finished = true; 
      restart();
    }
    
    image(rocket, (width / 2) - 256, (height / 30) * (30 - progress), 512, 512);
    
    if ((!justPressed && mousePressed && (dist(mouseX, mouseY, top.x, top.y) < radius || dist(mouseX, mouseY, middle.x, middle.y) < radius || dist(mouseX, mouseY, bottom.x, bottom.y) < radius)) || correct == -1) {
      if (correct != -1) {
        if (dist(mouseX, mouseY, top.x, top.y) < radius && correct == 0) {
          progress++;
          flash(color(0,255,0),20);
        } else if (dist(mouseX, mouseY, middle.x, middle.y) < radius && correct == 1) {
          progress++;
          flash(color(0,255,0),20);
        } else if (dist(mouseX, mouseY, bottom.x, bottom.y) < radius && correct == 2) {
          progress++;
          flash(color(0,255,0),20);
        } else {
          flash(color(255,0,0),20);
        }
      }
      
      justPressed = true;
      int index = round(random(0, colors.length-1));
      ccorrect = colors[index];
      nameToGuess = names[index];
      correct = round(random(0,2));
      ArrayList<Integer> colorsAvailable = Arrays.asList(colors);
      if (correct == 0) {
        ctop = ccorrect;
        cmiddle = colors[round(random(0, colors.length-1))];
        cbottom = colors[round(random(0, colors.length-1))];
      }
      if (correct == 1) {
        ctop = colors[round(random(0, colors.length-1))];
        cmiddle = ccorrect;
        cbottom = colors[round(random(0, colors.length-1))];
      }
      if (correct == 2) {
        ctop = colors[round(random(0, colors.length-1))];
        cmiddle = colors[round(random(0, colors.length-1))];
        cbottom = ccorrect;
      }
      
      
    }
    if (!mousePressed) justPressed = false;
    
    stroke(0);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(80);
    text(nameToGuess, width / 2, height / 8);
    
    ellipseMode(CENTER);
    noStroke();
    fill(ctop);
    ellipse(top.x, top.y, radius, radius);
    fill(cmiddle);
    ellipse(middle.x, middle.y, radius, radius);
    fill(cbottom);
    ellipse(bottom.x, bottom.y, radius, radius);
  }
  
  void dispose() {
    SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(getContext());
    SharedPreferences.Editor editor = preferences.edit();
    editor.putInt("ColorLesson",progress);
    editor.commit();
    println("Save succesful");
  }
  
  private void flash(color c, int time) {
    flashColor = c;
    flashTime = time;
  }
}
