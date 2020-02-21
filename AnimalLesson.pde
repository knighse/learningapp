class AnimalLesson extends Lesson {
  color[] colors = new color[]{color(0, 0, 255), color(0, 255, 0), color(255, 0, 0), color(100, 0, 155), color(255, 255, 0), color(255, 7, 255), color(255, 150, 0), color(150, 75, 0), color(0), color(250)};
  String[] names = new String[]{"Blue", "Green", "Red", "Purple", "Yellow", "Pink", "Orange", "Brown", "Black", "White"};
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
  int maxLessons = 20;

  SoundFile good;
  SoundFile bad;
  SoundFile finishedSound;

  AnimalLesson() {
    good = new SoundFile(applet, "Good.wav");
    bad = new SoundFile(applet, "Bad.wav");
    finishedSound = new SoundFile(applet, "Finished.wav");

    name = "Animal Spotter";
    desc = "The animals have escaped! Listen to the sound and touch the animal that makes the sound to put them back in the zoo.";
    icon = loadImage("Colors.png");
    soundButton = new SoundButton("Colors.wav");

    try {
      if (wipeData) {
        throw new Exception();
      }

      SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(getContext());
      progress = preferences.getInt("ColorLesson", -1);

      if (progress < 0) {
        throw new Exception();
      }

      if (progress > 0) {
        inProgress = true;
      }
      if (progress > maxLessons) {
        finished = true;
      }
    } 
    catch (Exception e) {
      wipeProgress();
    }
  }

  void wipeProgress() {
    SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(getContext());
    SharedPreferences.Editor editor = preferences.edit();
    editor.putInt("ColorLesson", 0);
    editor.commit();

    progress = 0;
  }

  void display() {
    if (progress > maxLessons) {
      finishedSound.play();
      finished = true; 
      restart();
      return;
    }
    
    if (flashTime > 0) {
      background(flashColor);
      flashTime--;
      if (flashTime == 0) {
        SoundFile f = new SoundFile(applet, nameToGuess + ".wav");
        f.play();
      }
      return;
    }

    image(rocket, (width / 2) - 256, ((height / maxLessons) * (maxLessons - progress))-512, 512, 512);

    if ((!justPressed && mousePressed && (dist(mouseX, mouseY, top.x, top.y) < radius || dist(mouseX, mouseY, middle.x, middle.y) < radius || dist(mouseX, mouseY, bottom.x, bottom.y) < radius)) || correct == -1) {
      boolean firstRun = false;
      
      if (correct != -1) {
        if (dist(mouseX, mouseY, top.x, top.y) < radius && correct == 0) {
          progress++;
          flash(color(0, 255, 0));
          good.play();
        } else if (dist(mouseX, mouseY, middle.x, middle.y) < radius && correct == 1) {
          progress++;
          flash(color(0, 255, 0));
          good.play();
        } else if (dist(mouseX, mouseY, bottom.x, bottom.y) < radius && correct == 2) {
          progress++;
          flash(color(0, 255, 0));
          good.play();
        } else {
          flash(color(255, 0, 0));
          bad.play();
        }
      } else {
        firstRun = true;
      }

      justPressed = true;
      int index = round(random(0, colors.length-1));
      ccorrect = colors[index];
      nameToGuess = names[index];
      correct = round(random(0, 2));
      ArrayList<Integer> colorsAvailable = new ArrayList();
      for (int n : colors) {
        colorsAvailable.add(n);
      }
      colorsAvailable.remove(index);

      if (correct == 0) {
        ctop = ccorrect;
        cmiddle = colorsAvailable.get(round(random(0, colorsAvailable.size()-1)));
        cbottom = colorsAvailable.get(round(random(0, colorsAvailable.size()-1)));
      }
      if (correct == 1) {
        cmiddle = ccorrect;
        ctop = colorsAvailable.get(round(random(0, colorsAvailable.size()-1)));
        cbottom = colorsAvailable.get(round(random(0, colorsAvailable.size()-1)));
      }
      if (correct == 2) {
        ctop = colorsAvailable.get(round(random(0, colorsAvailable.size()-1)));
        cmiddle = colorsAvailable.get(round(random(0, colorsAvailable.size()-1)));
        cbottom = ccorrect;
      }
      
      if (firstRun) {
        SoundFile f = new SoundFile(applet, nameToGuess + ".wav");
        f.play();
      }
    }
    if (!mousePressed) justPressed = false;

    noStroke();
    fill(255);
    rect((width/2)-150, (height/8)-40, 300, 80);
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
    editor.putInt("ColorLesson", progress);
    editor.commit();
    println("Save succesful");
    good.stopPlayer();
    bad.stopPlayer();
  }

  private void flash(color c) {
    flashColor = c;
    flashTime = 100;
  }
}
