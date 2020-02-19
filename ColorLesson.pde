class ColorLesson extends Lesson {
  ColorLesson() {
    name = "Colors";
    desc = "Learn your colors with this exciting lesson about colors and their names! Listen to the color's name and tap on which one it is. How many can you get? (Rounds: 30, Est. Time: 5-10min)";
    icon = loadImage("Colors.png");
    soundButton = new SoundButton("Colors.wav");
    
    try {
      progress = int(loadStrings("colorLesson.txt")[0]);
    } catch (Exception e) {
      //Progress is zero by default (it's in Lesson class)
      saveStrings("colorLesson.txt", new String[]{str(progress)});
    }
  }
  
  void display() {
    text("progress = " + progress, 10, 70);
  }
  
  void dispose() {
    saveStrings("colorLesson.txt", new String[]{str(progress)});
  }
}
