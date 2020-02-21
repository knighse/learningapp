class HomePage extends Page {
  LessonButton colorLessonBtn;
  ColorLesson colorLesson;
  
  LessonButton animalLessonBtn;
  AnimalLesson animalLesson;
  
  LessonButton wordLessonBtn;
  WordLesson wordLesson;
  
  HomePage() {
    colorLesson = new ColorLesson();
    pages.add(colorLesson);
    colorLessonBtn = new LessonButton(this, colorLesson);
    colorLessonBtn.position.y = colorLessonBtn.padding + colorLessonBtn.hbuttonHeight + 50;
    
    animalLesson = new AnimalLesson();
    pages.add(animalLesson);
    animalLessonBtn = new LessonButton(this, animalLesson);
    animalLessonBtn.position.y = (animalLessonBtn.padding * 2) + (animalLessonBtn.buttonHeight * 1) + animalLessonBtn.hbuttonHeight + 50;
    
    wordLesson = new WordLesson();
    pages.add(wordLesson);
    wordLessonBtn = new LessonButton(this, animalLesson);
    wordLessonBtn.position.y = (wordLessonBtn.padding * 3) + (wordLessonBtn.buttonHeight * 2) + wordLessonBtn.hbuttonHeight + 50;
  }
  
  void display() {
    colorLessonBtn.display();
  }
  
  void dispose() {
    colorLessonBtn.dispose();
  }
}
