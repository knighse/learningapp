class ColorLesson extends Lesson {
  color[] colors = new color[]{color(0, 0, 255), color(0, 255, 0), color(255, 0, 0), color(100, 0, 255), color(255, 255, 0), color(255, 0, 255), color(255, 150, 0)};
  String[] names = new String[]{"Blue", "Green", "Red", "Purple", "Yellow", "Pink", "Orange"};
  //top = 0, middle = 1, bottom = 2
  int correct = -1;
  color ctop;
  color cmiddle;
  color cbottom;
  PVector top = new PVector(width/2, height/4);
  PVector middle = new PVector(width/2, (height/4)*2);
  PVector bottom = new PVector(width/2, (height/4)*3);
  float radius = 100;
  
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
    text("progress = " + progress, 10, 70);
    if (progress >= 30) {
      finished = true; 
      restart();
    }
    
    if ((mousePressed && (dist(mouseX, mouseY, top.x, top.y) < radius || dist(mouseX, mouseY, middle.x, middle.y) < radius || dist(mouseX, mouseY, bottom.x, bottom.y) < radius)) || correct == -1) {
      
    }
  }
  
  void dispose() {
    SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(getContext());
    SharedPreferences.Editor editor = preferences.edit();
    editor.putInt("ColorLesson",progress);
    editor.commit();
    println("Save succesful");
  }
}
