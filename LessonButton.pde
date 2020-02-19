class LessonButton {
  PVector position = new PVector(width/2, height/2);
  float padding = 10;
  float hpadding = padding * 0.5;
  float dpadding = padding * 2;
  float buttonWidth = displayWidth - dpadding;
  float hbuttonWidth = buttonWidth * 0.5;
  float buttonHeight = 500;
  float hbuttonHeight = buttonHeight * 0.5;
  Page parent;
  Lesson lesson;
  
  
  LessonButton(Page parent, Lesson lesson) {
    this.lesson = lesson;
    pages.add(lesson);
    lesson.shown = false;
    this.parent = parent;
  }
  
  void display() {
    noFill();
    strokeWeight(3);
    stroke(0);
    rect(position.x - hbuttonWidth, position.y - hbuttonHeight, buttonWidth, buttonHeight);
    
    fill(0);
    stroke(0);
    strokeWeight(1);
    textSize(80);
    text(lesson.name, position.x - (hbuttonWidth - dpadding), position.y - (hbuttonHeight - dpadding));
    textSize(50);
    text(lesson.desc, position.x - (hbuttonWidth - dpadding), position.y - (hbuttonHeight - 100), buttonWidth - (buttonHeight + dpadding), buttonHeight - dpadding);
    
    image(lesson.icon, position.x + (hbuttonWidth - buttonHeight), position.y - hbuttonHeight, buttonHeight, buttonHeight);
    
    lesson.soundButton.position.x = position.x + (hbuttonWidth + lesson.soundButton.hbuttonSize);
    lesson.soundButton.position.y = position.y - (hbuttonHeight + lesson.soundButton.hbuttonSize);
    lesson.soundButton.display();
    
    if (lesson.finished) {
      image(finishedImg, position.x + (hbuttonWidth - dpadding), position.y + (hbuttonHeight - dpadding), 64, 64);
    } else if (lesson.inProgress) {
      image(inProgressImg, position.x + (hbuttonWidth - dpadding), position.y + (hbuttonHeight - dpadding), 64, 64);
    }
    
    if (mousePressed && mouseX > position.x - hbuttonWidth && mouseX < position.x + hbuttonWidth && mouseY > position.y - hbuttonHeight && mouseY < position.y + hbuttonHeight) {
      parent.shown = false;
      lesson.shown = true;
      isHomepage = false;
    }
  }
}
