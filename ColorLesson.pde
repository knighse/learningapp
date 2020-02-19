class ColorLesson extends Lesson {
  color[] colors = new color[]{color(0, 0, 255), color(0, 255, 0), color(255, 0, 0), color(100, 0, 255), color(255, 255, 0), color(255, 0, 255), color(255, 150, 0)};
  String[] names = new String[]{"Blue", "Green", "Red", "Purple", "Yellow", "Pink", "Orange"};
  
  ColorLesson() {
    name = "Colors";
    desc = "Learn your colors with this exciting lesson about colors and their names! Listen to the color's name and tap on which one it is. How many can you get? (Rounds: 30, Est. Time: 5-10min)";
    icon = loadImage("Colors.png");
    soundButton = new SoundButton("Colors.wav");
    
    try {
      progress = int(loadStrings("colorLesson.txt")[0]);
      if (progress > 0) {
        inProgress = true;
      }
    } catch (Exception e) {
      saveStrings("colorLesson.txt", new String[]{"0"});
    }
  }
  
  void display() {
    text("progress = " + progress, 10, 70);
    if (progress >= 30) {
      finished = true;
      restart();
    }
    if (mousePressed) {
      progress++;
    }
  }
  
  void dispose() {
    saveStrings("colorLesson.txt", new String[]{str(progress)});
    println("Save succesful");
  }
}
