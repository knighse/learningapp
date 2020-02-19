class HomePage extends Page {
  LessonButton colorLessonBtn;
  ColorLesson colorLesson;
  
  HomePage() {
    colorLesson = new ColorLesson();
    pages.add(colorLesson);
    colorLessonBtn = new LessonButton(this, colorLesson);
  }
  
  void display() {
    colorLessonBtn.display();
  }
  
  void dispose() {
    colorLessonBtn.dispose();
  }
}
