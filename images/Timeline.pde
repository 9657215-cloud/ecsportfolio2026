// Hailey | 25 Feb 2026 | Timeline
void setup() {
  size(950,400);
}
void draw() {
background(#FFB6C1);
drawRef();
histEvent(115,200, "Feb 1985",true, "Born in Madeira, Portugal");
histEvent(415,300, "2003",false," Signed with Manchester United");
histEvent(250,200, "1197",true," Joins Sporting CP youth academy at age 12, moving to Lisbon");
histEvent(300,300, "2002",false,"  Made his debut on Sporting CP's first team");
histEvent(500,200, "2008",true,"Won his first Ballon d'Or and Champions League Title");
histEvent(560,300, "2009",false, "Transferred to Real Madrid");
histEvent(700,200, "2018",true,"Signed with Juventus after winning four more Champion League titles with Madrid ");
histEvent(800,300, "2021",false, "Returned to Manchester United");
histEvent(890,200, "2023",true, "Joined Saudi-Arabian club Al Nassr");

}
void drawRef() {
  textAlign (CENTER);
  textSize(36);
  fill(60);
  text("Cristiano Ronaldo: Timeline",width/2,70);
 textSize(16);
  text("By Hailey Price",width/2,90);
  strokeWeight(5);
  line(50,250,900,250);
 textSize(16);
  text("1980", 50,275);
   text("2025", 900,275);
   strokeWeight(2);
   line(50,245,50,255);
line(900,245,900,255);
line(235,245,235,255);
line(400,245,400,255);
line(370,245,370,255);
line(500,245,500,255);
line(560,245,560,255);
line(100,245,100,255);
line(700,245,700,255);
line(800,245,800,255);
line(500,245,500,255);
}
void histEvent(int x,int y, String title, boolean top, String detail) {
  if(top == true) {
  line(x,y,x-15,y+50);
  } else {
    line(x,y,x-15,y-50);
  }
  rectMode(CENTER);
 strokeWeight(1.5);
 fill(0);
 rect(x,y,100,30,10);
 fill(#ffffffff);
 text(title,x,y+5);
 if(mouseX > x-50 && mouseX < x+50 && mouseY < y-15 && mouseY < y+15) {
   text(detail,width/2, 350);
}
  }
