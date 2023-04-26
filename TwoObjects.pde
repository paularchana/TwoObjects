/* Author Name: Archana Paul
   Date: April 26, 2023*/
   
CIRCLE myCircle;
color aColor;

CIRCLE[] allCircles;

SQUARE mySquare;
SQUARE[] allSquares;

final float CIRCLE_MIN = 5;
final float CIRCLE_MAX = 50;

void setup() {
  size(801, 801);

  allCircles = new CIRCLE[20];
  allSquares = new SQUARE[20];

  populateArrays();
}//End setup

void populateArrays() {
  for (int i= 0; i<allCircles.length; i++) {

    // circle elements
    float radius = random(CIRCLE_MIN, CIRCLE_MAX);
    float tempX = random(radius, width - radius);
    float tempY = random(radius, height - radius);

    // squire elements
    float tempX1 = random(0, width);
    float tempY1 = random(0, height);
    float tempW = random(10, 100);
    float tempH = tempW; // for a rectangle to be a squire, the width is same as height.

    aColor = color(random(255), random(255), random(255));
    myCircle = new CIRCLE(tempX, tempY, radius, aColor);
    allCircles[i] = myCircle;

    aColor = color(random(255), random(255), random(255));
    mySquare = new SQUARE(tempX1, tempY1, tempW, tempH, aColor);

    allSquares[i] = mySquare;
  }//First loop
}

void draw() {
  background(255);
  for (int i = 0; i < allCircles.length; i++) {
    if (allCircles[i] != null) {
      allCircles[i].display();
    }
    if (allSquares[i] != null) {
      allSquares[i].display();
    }
  }//End loop
}//End draw

void mousePressed() {
 if (mouseButton == RIGHT) {
    delete_Circles(allCircles);
  }
  if (mouseButton == LEFT) {
    delete_Squares(allSquares);
  }
}

void delete_Circles(CIRCLE[] array) {
  for (int i = 0; i<array.length; i++) {
    if (array[i] != null && array[i].r > 25) {
      array[i] = null;
    }
  }
}//End loop


void delete_Squares(SQUARE[] array) {
  for (int i = 0; i<array.length; i++) {
    if (array[i] != null && array[i].sH > 50) {
      array[i] = null;
    }
  }
}//End loop




//if(array[i] != null){
//      println("i: " + i + " Val " + array[i].r);
//    } else {
//      println("i: " + i + " Val null");
//    }

//}//End function
// allCircles[7] = null;

//[] -> ... 5, 6,  7,   8, 9 ...
//      ... C, C, null, C, C ...
