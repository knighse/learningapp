class HomePage extends Page {
  LessonButton colorLessonBtn;
  ColorLesson colorLesson;
  
  HomePage() {
    colorLesson = new ColorLesson();
    pages.add(colorLesson);
    colorLessonBtn = new LessonButton(this, colorLesson);
    colorLessonBtn.position.y = colorLessonBtn.padding + colorLessonBtn.hbuttonHeight + 50;
  }
  
  void display() {
    image(logo, width/2 - logo.width/2, height/2 - logo.height/2);
    colorLessonBtn.display();
  }
  
  void dispose() {
    colorLessonBtn.dispose();
  }
}
