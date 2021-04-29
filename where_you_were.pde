PImage img;
boolean is_drawn = false;
boolean sq_loop = true;
int sq_count = 100;
int border = 2;
void settings(){
  img = loadImage("img.jpg");
  size(img.width, img.height);
}

void draw(){
  if (!is_drawn){
    image(img,0,0);
    is_drawn = true;
  }
  //rect(width/2 + 50, height/3 - 20, 300, 510);
  if (sq_loop){
    for (int i = 0; i < sq_count; i++){
      int start_x  = int(random(width/2 , width/2 + 350));
      int start_y  = int(random(height/3 - 20, width/2 + 490));
      int w = int(random(50, 100));
      int h = int(random(50, 100));
      int end_x = int(start_x+random(-5,5));
      int end_y = int(start_y+random(-5,5));
      int W = int(w*random(0.5, 1.3));
      int H = int(h*random(0.5, 1.3));
      noStroke();
      float coinflip = random(-1,1);
      if (coinflip < 0){
        fill(255, random(20,50));
      } else {
        fill(0, random(20,50));
      }
      //rect(end_x-border, end_y-border, W+border*2, H+border*2);
      rect(end_x, end_y, w, h);
      copy(img, start_x, start_y, w, h, end_x, end_y, W, H);
    }
    sq_loop = false;
  }
}

void keyReleased(){
      if (key == 'b'){
      init();
    } else if (key=='s') {
      saveFrame("frames/######.png");
    }
}

void init(){
  is_drawn = false;
  sq_loop = true;
}
