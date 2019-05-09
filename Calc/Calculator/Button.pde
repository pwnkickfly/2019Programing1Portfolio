class Button {
  // member variables
  int x, y, w, h, v;
  String op;
  color c;
  boolean hov, asOperator;
  // multiple constructors for numbers and other buttons
  Button(int x, int y, int w, int h, int v, color c) {
    this.x= x;
    this.y= y;
    this.w= w;
    this.h= h;
    this.v= v;
    this.c= c;
    hov = false;
  }

  Button asOperator(String op) {
    this.op= op;
    asOperator = true;
    return this;
  }

  // dsiplay method 
  void display() {
    if (asOperator) {
      rectMode(CENTER);
      if(hov){
        fill(#381771);
      }else{
        fill(c);
      }
      strokeWeight(3);
      rect(x, y, w, h, 5);
      textAlign(CENTER, CENTER);
      textSize(40);
      fill(255);
      text(op, x+2, y-5);
    } else {
      rectMode(CENTER);
      if(hov){
        fill(#381771);
      }else{
        fill(c);
      }
      strokeWeight(3);
      rect(x, y, w, h, 5);
      //strokeWeight(5);
      //rect(x+3, y+3, w, h, 5);
      textAlign(CENTER, CENTER);
      textSize(40);
      fill(255);
      text(v, x+2, y-5);
    }
  }
  //hover method
  void hover(){
    hov = mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2;
  }
}
