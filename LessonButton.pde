class LessonButton {
  PVector position = new PVector(width/2, height/2);
  float padding = 60;
  float hpadding = padding * 0.5;
  float dpadding = padding * 2;
  float buttonWidth = displayWidth - dpadding;
  float hbuttonWidth = buttonWidth * 0.5;
  float buttonHeight = 550;
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
    textAlign(LEFT, TOP);
    fill(0);
    roundRect((position.x - hbuttonWidth) - 3, (position.y - hbuttonHeight) - 3, buttonWidth + 6, buttonHeight + 6, 30);
    if (lesson.finished) {
      fill(200);
    } else {
      fill(255);
    }
    roundRect(position.x - hbuttonWidth, position.y - hbuttonHeight, buttonWidth, buttonHeight, 30);
    
    fill(0);
    stroke(0);
    strokeWeight(1);
    textSize(85);
    text(lesson.name, position.x - (hbuttonWidth - hpadding), position.y - (hbuttonHeight - 5));
    textSize(60);
    text(lesson.desc, position.x - (hbuttonWidth - hpadding), position.y - (hbuttonHeight - 90), buttonWidth - (buttonHeight + padding), buttonHeight - padding);
    
    image(lesson.icon, position.x + (hbuttonWidth - buttonHeight), position.y - hbuttonHeight, buttonHeight, buttonHeight);
    
    lesson.soundButton.position.x = position.x + (hbuttonWidth - lesson.soundButton.hbuttonSize);
    lesson.soundButton.position.y = position.y - (hbuttonHeight - lesson.soundButton.hbuttonSize);
    lesson.soundButton.display();
    
    if (lesson.finished) {
      image(finishedImg, position.x + (hbuttonWidth - 128), position.y + (hbuttonHeight - 128));
    } else if (lesson.inProgress) {
      image(inProgressImg, position.x + (hbuttonWidth - 128), position.y + (hbuttonHeight - 128));
    }
    
    if (!lesson.finished && mousePressed && mouseX > position.x - hbuttonWidth && mouseX < position.x + (hbuttonWidth - lesson.soundButton.buttonSize) && mouseY > position.y - hbuttonHeight && mouseY < position.y + hbuttonHeight) {
      parent.shown = false;
      lesson.soundButton.dispose();
      lesson.shown = true;
      isHomepage = false;
    }
  }
  
  void dispose() {
    lesson.soundButton.dispose();
  }
}
