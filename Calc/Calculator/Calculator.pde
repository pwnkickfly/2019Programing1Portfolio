//Za Purple Calculator
//By Anthony Liu 
Button[] numBtns = new Button[10];
Button[] opBtns = new Button[13]; 
String displayVal, leftVal, rightVal;
char opVal;
float result;
boolean firstNum, dec; 

void setup() {
  size(700, 900);
  displayVal = "";
  leftVal = "";
  rightVal = "";
  opVal = ' ';
  result = 0.0;
  firstNum = true;
  dec = false;
  numBtns[0] = new Button(290, 725, 90, 60, 0, color(#A774F0));
  numBtns[1] = new Button(170, 635, 90, 60, 1, color(#A774F0));
  numBtns[2] = new Button(290, 635, 90, 60, 2, color(#A774F0));
  numBtns[3] = new Button(410, 635, 90, 60, 3, color(#A774F0));
  numBtns[4] = new Button(170, 545, 90, 60, 4, color(#A774F0));
  numBtns[5] = new Button(290, 545, 90, 60, 5, color(#A774F0));
  numBtns[6] = new Button(410, 545, 90, 60, 6, color(#A774F0));
  numBtns[7] = new Button(170, 455, 90, 60, 7, color(#A774F0));
  numBtns[8] = new Button(290, 455, 90, 60, 8, color(#A774F0));
  numBtns[9] = new Button(410, 455, 90, 60, 9, color(#A774F0));

  opBtns[0] = new Button(530, 365, 90, 60, 0, color(#5A26B4)).asOperator("+");
  opBtns[1] = new Button(530, 455, 90, 60, 0, color(#5A26B4)).asOperator("-");
  opBtns[2] = new Button(530, 545, 90, 60, 0, color(#5A26B4)).asOperator("÷");
  opBtns[3]= new Button(530, 635, 90, 60, 0, color(#5A26B4)).asOperator("x");
  opBtns[4] = new Button(530, 275, 90, 60, 0, color(#5A26B4)).asOperator("^");
  opBtns[5] = new Button(470, 725, 210, 60, 0, color(#5A26B4)).asOperator("=");
  opBtns[6] = new Button(170, 725, 90, 60, 0, color(#A774F0)).asOperator(".");
  opBtns[7] = new Button(170, 365, 90, 60, 0, color(#7E3FD8)).asOperator("sin");
  opBtns[8] = new Button(290, 365, 90, 60, 0, color(#7E3FD8)).asOperator("cos");
  opBtns[9] = new Button(410, 365, 90, 60, 0, color(#7E3FD8)).asOperator("tan");
  opBtns[10] = new Button(410, 275, 90, 60, 0, color(#7E3FD8)).asOperator("+/-");
  opBtns[11] = new Button(290, 275, 90, 60, 0, color(#7E3FD8)).asOperator("√");
  opBtns[12] = new Button(170, 275, 90, 60, 0, color(#4D0B95)).asOperator("C");
}

void draw() {
  rectMode(CENTER);
  background(#2B0258);
  fill(#D7BDFC);
  rect(width/2, height/2, 490, 680, 30);
  for (int i=0; i<numBtns.length; i++) {
    numBtns[i].display();
    numBtns[i].hover();
  }
  for (int i=0; i<opBtns.length; i++) {
    opBtns[i].display();
    opBtns[i].hover();
  }
  if(keyPressed){
    println(keyCode);
  }
  updateDisplay();
} 

void updateDisplay() {
  rectMode(CENTER);
  fill(#36036C);
  rect(width/2, 180, 450, 70, 3);
  fill(255);
  textAlign(RIGHT, CENTER);
  if (displayVal== "NaN") {
    text("NaNi", 555, 185);
  } else {
    text(displayVal, 555, 185);
  }
}

void mouseReleased() {
  for (int i=0; i<numBtns.length; i++) {
    if (numBtns[i].hov) {
      if (firstNum) {
        leftVal += str(numBtns[i].v);
        displayVal = leftVal;
      } else {
        rightVal += str(numBtns[i].v);
        displayVal = rightVal;
      }
    }
  }
  for (int i=0; i<opBtns.length; i++) {
    if (opBtns[i].hov) {
      if (opBtns[i].op == "+") {
        opVal = '+';
        displayVal += opVal;
        firstNum = false;
        dec = false;
      } else if (opBtns[i].op == "-") {
        opVal = '-';
        displayVal += opVal;
        firstNum = false;
        dec = false;
      } else if (opBtns[i].op == "x") {
        opVal = 'x';
        displayVal += opVal;
        firstNum = false;
        dec = false;
      } else if (opBtns[i].op == "÷") {
        opVal = '÷';
        displayVal += opVal;
        firstNum = false;
        dec = false;
      } else if (opBtns[i].op == "^") {
        opVal = '^';
        displayVal += opVal;
        firstNum = false;
      } else if (opBtns[i].op == ".") {
        opVal = '.';
        if (!dec) {
          if (firstNum) {
            leftVal += opBtns[i].op;
            displayVal = leftVal;
            dec = true;
          } else {
            rightVal += opBtns[i].op;
            displayVal = rightVal;
            dec = true;
          }
        }
      } else if (opBtns[i].op == "+/-") {
        if (firstNum) {
          leftVal = str(float(leftVal) * -1);
          displayVal = leftVal;
        } else {
          rightVal = str(float(rightVal) * -1);
          displayVal = rightVal;
        }
      } else if (opBtns[i].op == "√") {
        if (firstNum) {
          leftVal = str(sqrt(float(leftVal)));
          displayVal = leftVal;
        } else {
          rightVal = str(sqrt(float(rightVal)));
          displayVal = rightVal;
        }
      } else if (opBtns[i].op == "√") {
        if (firstNum) {
          leftVal = str(sqrt(float(leftVal)));
          displayVal = leftVal;
        } else {
          rightVal = str(sqrt(float(rightVal)));
          displayVal = rightVal;
        }
      } else if (opBtns[i].op == "sin") {
        if (firstNum) {
          leftVal = (str(sin(float(leftVal))));
          displayVal = leftVal;
        } else {
          rightVal = str(sin(float(rightVal)));
          displayVal = rightVal;
        }
      } else if (opBtns[i].op == "cos") {
        if (firstNum) {
          leftVal = (str(cos(float(leftVal))));
          displayVal = leftVal;
        } else {
          rightVal = str(cos(float(rightVal)));
          displayVal = rightVal;
        }
      } else if (opBtns[i].op == "tan") {
        if (firstNum) {
          leftVal = (str(tan(float(leftVal))));
          displayVal = leftVal;
        } else {
          rightVal = str(tan(float(rightVal)));
          displayVal = rightVal;
        }
      } else if (opBtns[i].op == "=") {
        performCalc();
      } else if (opBtns[i].op == "C") {
        clearApp();
      }
    }
  }
}

void performCalc() {
  if (opVal == '+') {
    result = float(leftVal) + float(rightVal);
    displayVal= str(result);
  } else if (opVal == '-') {
    result = float(leftVal) - float(rightVal);
    displayVal = str(result);
  } else if (opVal == 'x') {
    result = float(leftVal) * float(rightVal);
    displayVal= str(result);
  } else if (opVal == '÷') {
    result = float(leftVal) / float(rightVal);
    displayVal= str(result);
  } else if (opVal == '^') {
    result = pow(float(leftVal), float(rightVal));
    displayVal = str(result);
  }
  leftVal = displayVal;
  firstNum = true;
  dec = false;
}

void keyPressed() {
  if (key =='1') {
    handleKeyPress(true, "1");
  } else if (key =='2') {
    handleKeyPress(true, "2");
  } else if (key =='3') {
    handleKeyPress(true, "3");
  } else if (key =='4') {
    handleKeyPress(true, "4");
  } else if (key =='5') {
    handleKeyPress(true, "5");
  } else if (key =='6') {
    handleKeyPress(true, "6");
  } else if (key =='7') {
    handleKeyPress(true, "7");
  } else if (key =='8') {
    handleKeyPress(true, "8");
  } else if (key =='9') {
    handleKeyPress(true, "9");
  } else if (key =='0') {
    handleKeyPress(true, "0");
  } else if (key =='+') {
    handleKeyPress(false, "+");
  } else if (key == ENTER) {
    handleKeyPress(false, "=");
  } else if (key == 'c') {
    handleKeyPress(false, "C");
  } else if (key =='-') {
    handleKeyPress(false, "-");
  } else if (key =='*') {
    handleKeyPress(false, "x");
  } else if (key =='/') {
    handleKeyPress(false, "÷");
  } else if (key =='.') {
    handleKeyPress(false, ".");
  }
}

void handleKeyPress(boolean  num, String val) {
  if (num) {
    if (firstNum) {
      leftVal += val;
      displayVal = leftVal;
    } else {
      rightVal += val;
      displayVal = rightVal;
    }
  } else {
    if (val == "+") {
      opVal = '+';
      displayVal += val;
      firstNum = false;
      dec = false;
    }  
    if (val == "-") {
      opVal = '-';
      displayVal += val;
      firstNum = false;
      dec = false;
    } 
    if (val == "x") {
      opVal = 'x';
      displayVal += val;
      firstNum = false;
      dec = false;
    } 
    if (val == "÷") {
      opVal = '÷';
      displayVal += val;
      firstNum = false;
      dec = false;
    }
    if (val == ".") {
      opVal = '.';
      displayVal += val;
      dec = true;
      firstNum = false;
    }
    if (val == "=") {
      performCalc();
    } 
    if (val == "C") {
      clearApp();
    }
  }
}

void clearApp() {
  displayVal = "";
  leftVal = "";
  rightVal = "";
  opVal = ' ';
  result = 0.0;
  firstNum = true;
  dec = false;
}
