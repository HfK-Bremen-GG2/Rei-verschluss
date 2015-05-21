float intersectLeftX, intersectRightX, intersectY;
float upLeftX, upY, upRightX, lowLeftX, lowY, lowRightX;
float zipperUpLeftX, zipperUpRightX, zipperLowLeftX, zipperLowRightX;

void setup(){
  size(500,500);
  noFill();
  stroke(255,255,255);
  strokeWeight(15);
  
  // Ausgangswerte
  upLeftX = (width/2)-100;
  upRightX = (width/2)+100;
  upY = 100;
  lowLeftX = (width/2);
  lowRightX = (width/2);
  lowY = height-100;
  
  // Werte zum Zeichnen
  zipperUpLeftX = upLeftX;
  zipperUpRightX = upRightX;
  zipperLowLeftX = lowLeftX;
  zipperLowRightX = lowRightX;
  
  // Bogenvariablen, abhängig vom Cursor
  intersectLeftX = width/2;
  intersectRightX = width/2;
  intersectY = height/2;
}


void draw(){
  background(255,0,0);
  
  // Bewegung des Zippers
  if(mousePressed == true && mouseY>=upY && mouseY<=lowY){
      intersectY = mouseY;
      zipperUpLeftX = map(mouseY,upY,lowY,intersectLeftX,upLeftX);
      zipperUpRightX = map(mouseY,upY,lowY,intersectRightX,upRightX); 
      
      // falls man von unten kommt, muss es wieder angepasst werden
      intersectLeftX = width/2;
      intersectRightX = width/2;
      zipperLowLeftX = lowLeftX;
      zipperLowRightX = lowRightX; 
  }
  
  // untere Öffnung durch Verschiebung
 if(mousePressed == true && mouseY>=lowY){
      zipperLowLeftX = lowLeftX-(mouseY-lowY);
      zipperUpLeftX = upLeftX-(mouseY-lowY);
      intersectLeftX = width/2-(mouseY-lowY);
      zipperLowRightX = lowRightX+(mouseY-lowY);
      zipperUpRightX = upRightX+(mouseY-lowY);
      intersectRightX = width/2+(mouseY-lowY);

  }
  
  
  // left, bottom to top
  bezier(zipperLowLeftX, lowY,  intersectLeftX, intersectY,  intersectLeftX, intersectY, zipperUpLeftX, upY);
  
  // right, bottom to top
  bezier(zipperLowRightX, lowY,  intersectRightX, intersectY,  intersectRightX, intersectY, zipperUpRightX, upY);


}
