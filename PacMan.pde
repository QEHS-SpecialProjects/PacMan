import processing.sound.*;

SoundFile Coins;
SoundFile End;
SoundFile Move;

boolean Win = false;
boolean Stuck = false;
boolean Stuck2 = false;
String HorizontalDir = "";
String VerticalDir = "";

String HorizontalDir2 = "";
String VerticalDir2 = "";

int x = 14;
int y = 49;

int x2 = 484;
int y2 = 455;
  
int Px3 = 250;
int Py3 = 250;

int time = 120;
int lives = 3;

int Px = 186;
int Py = 193;
int Ps = 20;

int P2x = 250;
int P2y = 350;

int Gs = 20;
int Gs2 = 20;

int c;
int c2;
int c3;

int Rx = 150;
int Ry = 250;

int Scorx = 100;
int Scory = 100;
int ScorSize = 10;

boolean follow = false;
boolean Points = false;


ArrayList<Line> LineArr;

ArrayList<Points> PointsArr;

ArrayList<LineGhost> GhostLineArr;

int move;
int move2;
int moveG;
int moveG2;

boolean wKey = false;
boolean sKey = false;
boolean aKey = false;
boolean dKey = false;

boolean GhostUp = false;
boolean GhostDown = false;
boolean GhostLeft = false;
boolean GhostRight = false;
boolean goGhost = false;

boolean up = false;
boolean down = false;
boolean left = false;
boolean right = false;

boolean stopX = false;
boolean stopY = false;

boolean Play = false;
boolean Multiplayer = false;
boolean Menu = true;
boolean GameOver = false;
boolean go = false;
boolean go2 = false;

float r = random(255);
float g = random(255);
float b = random(255);

boolean Score = true;

int Score1 = 0;
int Score2 = 0;

int gameStep = 0;
int timing = 0;
int maxTime = 120;
boolean Play2 = false;




//SINGLE PLAYER
//MULTI PLAYER

void setup() {
  Px = 186;
  Py = 191;

  P2x = 250;
  P2y = 275;
  


  GameOver = false;
  timing = maxTime;
  Play = false;
  Menu = true;
  Score1 = 0;
  Score2 = 0;


  size(500, 500);
  background(0);

  PointsArr = new ArrayList<Points>();



  GhostLineArr = new ArrayList<LineGhost>();

  GhostLineArr.add(new LineGhost(44, 3, 226, 296));
  
  GhostLineArr.add(new LineGhost(44, 3, 226, 201));
  
  GhostLineArr.add(new LineGhost(3, 55, 196, 225));
  
  GhostLineArr.add(new LineGhost(3, 55, 296, 225));


  LineArr = new ArrayList<Line>();
  
  LineArr.add(new Line(5,27,195,200 ));
  LineArr.add(new Line(5,26,195,274 ));
  
  LineArr.add(new Line(31,5,195,200));
  LineArr.add(new Line(25,5,270,200));
  
  LineArr.add(new Line(30,5,195,295));
  
  LineArr.add(new Line(5,27,295,200));
  LineArr.add(new Line(5,26,295,274));
  
  LineArr.add(new Line(28,5,271,295));
  
  LineArr.add(new Line(5,100,320,250));
  LineArr.add(new Line(5,100,171,250));
  
  LineArr.add(new Line(105,5,195,319));
  LineArr.add(new Line(5,126,245,319));
  
  LineArr.add(new Line(5,100,171,130));
  LineArr.add(new Line(5,100,320,130));
  
  LineArr.add(new Line(55,5,171,176));
  LineArr.add(new Line(55,5,270,176));
  
  LineArr.add(new Line(5,53,245,130));
  LineArr.add(new Line(105,5,195,130));
  
  LineArr.add(new Line(197,40,-50,255));//IN
  LineArr.add(new Line(202,50,-50,250));
  LineArr.add(new Line(197,40,-50,185));//IN
  LineArr.add(new Line(202,50,-50,180));

  LineArr.add(new Line(200,40,349,255));
  LineArr.add(new Line(200,50,344,250));
  LineArr.add(new Line(200,40,349,185));
  LineArr.add(new Line(200,50,344,180));
  
  LineArr.add(new Line(5,145,0,35));
  LineArr.add(new Line(500,5,0,35));
  LineArr.add(new Line(5,145,494,35));
  
  LineArr.add(new Line(5,165,0,300));
  LineArr.add(new Line(500,5,0,465));
  LineArr.add(new Line(5,165,494,300));
  
  LineArr.add(new Line(65,43,28,63));//BOX 1
  LineArr.add(new Line(75,53,23,58));//BOX 1
  
  LineArr.add(new Line(99,43,122,63));//BOX 1 LONG
  LineArr.add(new Line(109,53,117,58));//BOX 1 LONG
  
  LineArr.add(new Line(65,43,405,63));//BOX 2
  LineArr.add(new Line(75,53,400,58));//BOX 2
  
  LineArr.add(new Line(103,43,275,63));//BOX 2 LONG
  LineArr.add(new Line(113,53,270,58));//BOX 2 LONG
  
  LineArr.add(new Line(5,76,245,36));
  
  LineArr.add(new Line(119,21,28,135));//BOX 3 UP
  LineArr.add(new Line(129,31,23,130));//BOX 3
  
  LineArr.add(new Line(121,21,349,135));//BOX 4 UP
  LineArr.add(new Line(131,31,344,130));//BOX 4
  
  LineArr.add(new Line(162,21,308,420));//BOX RIGHT DOWN
  LineArr.add(new Line(172,31,303,415));//BOX 4
  
  LineArr.add(new Line(161,21,25,420));//BOX LEFT DOWN
  LineArr.add(new Line(171,31,20,415));//BOX 4
  
  LineArr.add(new Line(119,11,29,324));//TINY LBOX LEFT DOWN
  LineArr.add(new Line(129,21,24,319));//TINY LBOX 4
  
  LineArr.add(new Line(123,11,349,324));//TINY LBOX RIGHT DOWN
  LineArr.add(new Line(133,21,344,319));//TINY LBOX 4
  
  LineArr.add(new Line(11,51,349,339));//TINY LBOX RIGHT DOWN
  LineArr.add(new Line(21,61,344,334));//TINY LBOX 4
  
  LineArr.add(new Line(11,51,137,339));//TINY LBOX LEFT DOWN
  LineArr.add(new Line(21,61,132,334));//TINY LBOX 4
  
  LineArr.add(new Line(81,26,389,364));
  LineArr.add(new Line(91,36,384,359));
  
  LineArr.add(new Line(81,26,29,364));
  LineArr.add(new Line(91,36,24,359));
  
  LineArr.add(new Line(45,42,176,348));
  LineArr.add(new Line(55,52,171,343));
  
  LineArr.add(new Line(45,42,275,348));
  LineArr.add(new Line(55,52,270,343));
  
  LineArr.add(new Line(6,40,215,420)); //1
  LineArr.add(new Line(16,50,210,415));
  
  LineArr.add(new Line(6,40,274,420)); //1
  LineArr.add(new Line(16,50,269,415));
}


void addNewPoint() {
  PointsArr.add(new Points(160, 125, 5, 5)); //LEFT
  PointsArr.add(new Points(160, 140, 5, 5)); 
  PointsArr.add(new Points(160, 155, 5, 5));
  PointsArr.add(new Points(160, 170, 5, 5));
  PointsArr.add(new Points(160, 185, 5, 5));
  PointsArr.add(new Points(160, 200, 5, 5));
  PointsArr.add(new Points(160, 215, 5, 5));
  PointsArr.add(new Points(160, 230, 5, 5));
  PointsArr.add(new Points(160, 245, 5, 5));
  PointsArr.add(new Points(160, 260, 5, 5));
  PointsArr.add(new Points(160, 275, 5, 5));
  PointsArr.add(new Points(160, 290, 5, 5));
  PointsArr.add(new Points(160, 305, 5, 5));
  PointsArr.add(new Points(160, 320, 5, 5));
  PointsArr.add(new Points(160, 335, 5, 5));
  PointsArr.add(new Points(160, 350, 5, 5));
  PointsArr.add(new Points(160, 365, 5, 5));
  PointsArr.add(new Points(160, 380, 5, 5));
  PointsArr.add(new Points(160, 395, 5, 5)); // LEFT DONE
  
  PointsArr.add(new Points(333, 125, 5, 5)); //RIGHT
  PointsArr.add(new Points(333, 140, 5, 5));
  PointsArr.add(new Points(333, 155, 5, 5)); 
  PointsArr.add(new Points(333, 170, 5, 5));
  PointsArr.add(new Points(333, 185, 5, 5));
  PointsArr.add(new Points(333, 200, 5, 5));
  PointsArr.add(new Points(333, 215, 5, 5));
  PointsArr.add(new Points(333, 230, 5, 5));
  PointsArr.add(new Points(333, 245, 5, 5));
  PointsArr.add(new Points(333, 260, 5, 5));
  PointsArr.add(new Points(333, 275, 5, 5));
  PointsArr.add(new Points(333, 290, 5, 5));
  PointsArr.add(new Points(333, 305, 5, 5));
  PointsArr.add(new Points(333, 320, 5, 5));
  PointsArr.add(new Points(333, 335, 5, 5));
  PointsArr.add(new Points(333, 350, 5, 5));
  PointsArr.add(new Points(333, 365, 5, 5));
  PointsArr.add(new Points(333, 380, 5, 5));
  PointsArr.add(new Points(333, 395, 5, 5)); //RIGHT DONE
  
  
  
  PointsArr.add(new Points(185, 145, 5, 5)); //1LEFT
  PointsArr.add(new Points(200, 145, 5, 5));
  PointsArr.add(new Points(215, 145, 5, 5));
  PointsArr.add(new Points(230, 145, 5, 5));
  
  PointsArr.add(new Points(185, 333, 5, 5)); // 1Down
  PointsArr.add(new Points(200, 333, 5, 5));
  PointsArr.add(new Points(215, 333, 5, 5));
  PointsArr.add(new Points(230, 333, 5, 5));
  
  PointsArr.add(new Points(230, 333, 5, 5)); //1DOWNDOWN
  PointsArr.add(new Points(230, 348, 5, 5));
  PointsArr.add(new Points(230, 363, 5, 5));
  PointsArr.add(new Points(230, 378, 5, 5));
  
  PointsArr.add(new Points(260, 145, 5, 5)); //1RIGHT
  PointsArr.add(new Points(275, 145, 5, 5));
  PointsArr.add(new Points(290, 145, 5, 5));
  PointsArr.add(new Points(305, 145, 5, 5));
  
  PointsArr.add(new Points(260, 333, 5, 5)); //1RIGHTDOWN
  PointsArr.add(new Points(275, 333, 5, 5));
  PointsArr.add(new Points(290, 333, 5, 5));
  PointsArr.add(new Points(305, 333, 5, 5));
  
  PointsArr.add(new Points(260, 333, 5, 5)); //1RIGHTDOWNDOWN
  PointsArr.add(new Points(260, 348, 5, 5));
  PointsArr.add(new Points(260, 363, 5, 5));
  PointsArr.add(new Points(260, 378, 5, 5));
  
  PointsArr.add(new Points(185, 145, 5, 5)); // 1Down
  PointsArr.add(new Points(200, 145, 5, 5));
  PointsArr.add(new Points(215, 145, 5, 5));
  PointsArr.add(new Points(230, 145, 5, 5));
  
  PointsArr.add(new Points(185, 165, 5, 5)); //2LEFT
  PointsArr.add(new Points(200, 165, 5, 5));
  PointsArr.add(new Points(215, 165, 5, 5));
  PointsArr.add(new Points(230, 165, 5, 5));
  
  PointsArr.add(new Points(260, 165, 5, 5)); //2RIGHT
  PointsArr.add(new Points(275, 165, 5, 5));
  PointsArr.add(new Points(290, 165, 5, 5));
  PointsArr.add(new Points(305, 165, 5, 5));
  
  PointsArr.add(new Points(14, 119, 5, 5));
  PointsArr.add(new Points(29, 119, 5, 5));
  PointsArr.add(new Points(44, 119, 5, 5));
  PointsArr.add(new Points(59, 119, 5, 5));
  PointsArr.add(new Points(74, 119, 5, 5));
  PointsArr.add(new Points(89, 119, 5, 5));
  PointsArr.add(new Points(104, 119, 5, 5));
  PointsArr.add(new Points(119, 119, 5, 5));
  PointsArr.add(new Points(134, 119, 5, 5));
  PointsArr.add(new Points(149, 119, 5, 5));
  PointsArr.add(new Points(164, 119, 5, 5));
  PointsArr.add(new Points(179, 119, 5, 5));
  PointsArr.add(new Points(194, 119, 5, 5));
  PointsArr.add(new Points(209, 119, 5, 5));
  PointsArr.add(new Points(224, 119, 5, 5));
  PointsArr.add(new Points(239, 119, 5, 5));
  PointsArr.add(new Points(254, 119, 5, 5));
  PointsArr.add(new Points(269, 119, 5, 5));
  PointsArr.add(new Points(284, 119, 5, 5));
  PointsArr.add(new Points(299, 119, 5, 5));
  PointsArr.add(new Points(314, 119, 5, 5));
  PointsArr.add(new Points(329, 119, 5, 5));
  PointsArr.add(new Points(344, 119, 5, 5));
  PointsArr.add(new Points(359, 119, 5, 5));
  PointsArr.add(new Points(374, 119, 5, 5));
  PointsArr.add(new Points(389, 119, 5, 5));
  PointsArr.add(new Points(404, 119, 5, 5));
  PointsArr.add(new Points(419, 119, 5, 5));
  PointsArr.add(new Points(434, 119, 5, 5));
  PointsArr.add(new Points(449, 119, 5, 5));
  PointsArr.add(new Points(464, 119, 5, 5));
  
  
  
  PointsArr.add(new Points(479, 119, 5, 5));//Y
  PointsArr.add(new Points(479, 134, 5, 5));//Y
  PointsArr.add(new Points(479, 149, 5, 5));//Y
  PointsArr.add(new Points(479, 164, 5, 5));//Y
  PointsArr.add(new Points(479, 89, 5, 5));//Y
  PointsArr.add(new Points(479, 74, 5, 5));//Y
  PointsArr.add(new Points(479, 59, 5, 5));//Y
  PointsArr.add(new Points(479, 104, 5, 5));//Y
  
  PointsArr.add(new Points(232, 49, 5, 5));
  PointsArr.add(new Points(232, 64, 5, 5));
  PointsArr.add(new Points(232, 79, 5, 5));
  PointsArr.add(new Points(232, 94, 5, 5));
  PointsArr.add(new Points(232, 109, 5, 5));
  
  PointsArr.add(new Points(256, 49, 5, 5));
  PointsArr.add(new Points(256, 64, 5, 5));
  PointsArr.add(new Points(256, 79, 5, 5));
  PointsArr.add(new Points(256, 94, 5, 5));
  PointsArr.add(new Points(256, 109, 5, 5));
  
  PointsArr.add(new Points(388, 64, 5, 5));
  PointsArr.add(new Points(388, 79, 5, 5));
  PointsArr.add(new Points(388, 94, 5, 5));
  PointsArr.add(new Points(388, 109, 5, 5));
  
  
  
  PointsArr.add(new Points(14, 49, 5, 5));//TOP
  
  PointsArr.add(new Points(14, 64, 5, 5));
  PointsArr.add(new Points(14, 79, 5, 5));
  PointsArr.add(new Points(14, 94, 5, 5));
  PointsArr.add(new Points(14, 109, 5, 5));
  PointsArr.add(new Points(14, 139, 5, 5));
  PointsArr.add(new Points(14, 154, 5, 5));
  
  PointsArr.add(new Points(29, 49, 5, 5));
  PointsArr.add(new Points(44, 49, 5, 5));
  PointsArr.add(new Points(59, 49, 5, 5));
  PointsArr.add(new Points(74, 49, 5, 5));
  PointsArr.add(new Points(89, 49, 5, 5));
  
  PointsArr.add(new Points(104, 49, 5, 5));
  PointsArr.add(new Points(104, 64, 5, 5));
  PointsArr.add(new Points(104, 79, 5, 5));
  PointsArr.add(new Points(104, 94, 5, 5));
  PointsArr.add(new Points(104, 109, 5, 5));
  
  PointsArr.add(new Points(119, 49, 5, 5));
  PointsArr.add(new Points(134, 49, 5, 5));
  PointsArr.add(new Points(149, 49, 5, 5));
  PointsArr.add(new Points(164, 49, 5, 5));
  PointsArr.add(new Points(179, 49, 5, 5));
  PointsArr.add(new Points(194, 49, 5, 5));
  PointsArr.add(new Points(209, 49, 5, 5));
  PointsArr.add(new Points(224, 49, 5, 5));
   PointsArr.add(new Points(269, 49, 5, 5));
  PointsArr.add(new Points(284, 49, 5, 5));
  PointsArr.add(new Points(299, 49, 5, 5));
  PointsArr.add(new Points(314, 49, 5, 5));
  PointsArr.add(new Points(329, 49, 5, 5));  
  PointsArr.add(new Points(344, 49, 5, 5));
  PointsArr.add(new Points(359, 49, 5, 5));
  PointsArr.add(new Points(374, 49, 5, 5));
  PointsArr.add(new Points(389, 49, 5, 5)); 
  PointsArr.add(new Points(404, 49, 5, 5));
  PointsArr.add(new Points(419, 49, 5, 5));
  PointsArr.add(new Points(434, 49, 5, 5));
  PointsArr.add(new Points(449, 49, 5, 5)); 
  PointsArr.add(new Points(464, 49, 5, 5));
  PointsArr.add(new Points(479, 49, 5, 5));//TOP DONE
  
  
  PointsArr.add(new Points(14, 168, 5, 5));//THIRD TOP
  PointsArr.add(new Points(29, 168, 5, 5));
  PointsArr.add(new Points(44, 168, 5, 5));
  PointsArr.add(new Points(59, 168, 5, 5));
  PointsArr.add(new Points(74, 168, 5, 5));
  PointsArr.add(new Points(89, 168, 5, 5));
  PointsArr.add(new Points(104, 168, 5, 5));
  PointsArr.add(new Points(119, 168, 5, 5));
  PointsArr.add(new Points(134, 168, 5, 5));
  PointsArr.add(new Points(149, 168, 5, 5));
  PointsArr.add(new Points(344, 168, 5, 5));
  PointsArr.add(new Points(359, 168, 5, 5));
  PointsArr.add(new Points(374, 168, 5, 5));
  PointsArr.add(new Points(389, 168, 5, 5));
  PointsArr.add(new Points(404, 168, 5, 5));
  PointsArr.add(new Points(419, 168, 5, 5));
  PointsArr.add(new Points(434, 168, 5, 5));
  PointsArr.add(new Points(449, 168, 5, 5));
  PointsArr.add(new Points(464, 168, 5, 5)); //THIRD TOPDONE
  
  
  
   PointsArr.add(new Points(14, 306, 5, 5));//FOURTH BOTTOM 
  PointsArr.add(new Points(29, 306, 5, 5));
  PointsArr.add(new Points(44, 306, 5, 5));
  PointsArr.add(new Points(59, 306, 5, 5));
  PointsArr.add(new Points(74, 306, 5, 5));
  PointsArr.add(new Points(89, 306, 5, 5));
  PointsArr.add(new Points(104, 306, 5, 5));
  PointsArr.add(new Points(119, 306, 5, 5));
  PointsArr.add(new Points(134, 306, 5, 5));
  PointsArr.add(new Points(149, 306, 5, 5));
  PointsArr.add(new Points(344, 306, 5, 5));
  PointsArr.add(new Points(359, 306, 5, 5));
  PointsArr.add(new Points(374, 306, 5, 5));
  PointsArr.add(new Points(389, 306, 5, 5));
  PointsArr.add(new Points(404, 306, 5, 5));
  PointsArr.add(new Points(419, 306, 5, 5));
  PointsArr.add(new Points(434, 306, 5, 5));
  PointsArr.add(new Points(449, 306, 5, 5));
  PointsArr.add(new Points(464, 306, 5, 5)); //FOURTH BOTTOMEST DONE
    
    
  PointsArr.add(new Points(122, 361, 5, 5));
  PointsArr.add(new Points(122, 376, 5, 5));
  PointsArr.add(new Points(122, 391, 5, 5));
  
  PointsArr.add(new Points(198, 440, 5, 5));
  PointsArr.add(new Points(198, 425, 5, 5));
  PointsArr.add(new Points(198, 410, 5, 5));
  
  PointsArr.add(new Points(234, 440, 5, 5));
  PointsArr.add(new Points(234, 425, 5, 5));
  PointsArr.add(new Points(234, 410, 5, 5));
  
  PointsArr.add(new Points(258, 440, 5, 5));
  PointsArr.add(new Points(258, 425, 5, 5));
  PointsArr.add(new Points(258, 410, 5, 5));
  
  PointsArr.add(new Points(292, 440, 5, 5));
  PointsArr.add(new Points(292, 425, 5, 5));
  PointsArr.add(new Points(292, 410, 5, 5));
  
  PointsArr.add(new Points(14, 324, 5, 5));
  PointsArr.add(new Points(14, 339, 5, 5));
  PointsArr.add(new Points(14, 354, 5, 5));
  PointsArr.add(new Points(14, 369, 5, 5));
  PointsArr.add(new Points(14, 384, 5, 5));
  PointsArr.add(new Points(14, 399, 5, 5));
  PointsArr.add(new Points(14, 414, 5, 5));
  PointsArr.add(new Points(14, 429, 5, 5));
  PointsArr.add(new Points(14, 444, 5, 5));
  PointsArr.add(new Points(14, 455, 5, 5));
    
    
    
    
  PointsArr.add(new Points(29, 346, 5, 5));//THIRD BOTTOM
  PointsArr.add(new Points(44, 346, 5, 5));
  PointsArr.add(new Points(59, 346, 5, 5));
  PointsArr.add(new Points(74, 346, 5, 5));
  PointsArr.add(new Points(89, 346, 5, 5));
  PointsArr.add(new Points(104, 346, 5, 5));
  PointsArr.add(new Points(119, 346, 5, 5));
  
  PointsArr.add(new Points(374, 346, 5, 5));
  PointsArr.add(new Points(374, 361, 5, 5));
  PointsArr.add(new Points(374, 376, 5, 5));
  PointsArr.add(new Points(374, 391, 5, 5));
  
  
  
  
  PointsArr.add(new Points(389, 346, 5, 5));
  PointsArr.add(new Points(404, 346, 5, 5));
  PointsArr.add(new Points(419, 346, 5, 5));
  PointsArr.add(new Points(434, 346, 5, 5));
  PointsArr.add(new Points(449, 346, 5, 5));
  PointsArr.add(new Points(464, 346, 5, 5)); //THIRD BOTTOMEST DONE
  
  
  
  PointsArr.add(new Points(29, 403, 5, 5));//2ndBOTTOM
  PointsArr.add(new Points(44, 403, 5, 5));
  PointsArr.add(new Points(59, 403, 5, 5));
  PointsArr.add(new Points(74, 403, 5, 5));
  PointsArr.add(new Points(89, 403, 5, 5));
  PointsArr.add(new Points(104, 403, 5, 5));
  PointsArr.add(new Points(119, 403, 5, 5));
  PointsArr.add(new Points(134, 403, 5, 5));
  PointsArr.add(new Points(149, 403, 5, 5));
  PointsArr.add(new Points(164, 403, 5, 5));
  PointsArr.add(new Points(179, 403, 5, 5));
  PointsArr.add(new Points(194, 403, 5, 5));
  PointsArr.add(new Points(209, 403, 5, 5));
  PointsArr.add(new Points(224, 403, 5, 5));
  PointsArr.add(new Points(239, 403, 5, 5));
  PointsArr.add(new Points(254, 403, 5, 5));
  PointsArr.add(new Points(269, 403, 5, 5));
  PointsArr.add(new Points(284, 403, 5, 5));
  PointsArr.add(new Points(299, 403, 5, 5));
  PointsArr.add(new Points(314, 403, 5, 5));
  PointsArr.add(new Points(329, 403, 5, 5));  
  PointsArr.add(new Points(344, 403, 5, 5));
  PointsArr.add(new Points(359, 403, 5, 5));
  PointsArr.add(new Points(374, 403, 5, 5));
  PointsArr.add(new Points(389, 403, 5, 5));  
  PointsArr.add(new Points(404, 403, 5, 5));
  PointsArr.add(new Points(419, 403, 5, 5));
  PointsArr.add(new Points(434, 403, 5, 5));
  PointsArr.add(new Points(449, 403, 5, 5));  
  PointsArr.add(new Points(464, 403, 5, 5)); //SECOND BOTTOM DONE
  
  
  
  PointsArr.add(new Points(29, 453, 5, 5));//BOTTOMEST
  PointsArr.add(new Points(44, 453, 5, 5));
  PointsArr.add(new Points(59, 453, 5, 5));
  PointsArr.add(new Points(74, 453, 5, 5));
  PointsArr.add(new Points(89, 453, 5, 5));
  PointsArr.add(new Points(104, 453, 5, 5));
  PointsArr.add(new Points(119, 453, 5, 5));
  PointsArr.add(new Points(134, 453, 5, 5));
  PointsArr.add(new Points(149, 453, 5, 5));
  PointsArr.add(new Points(164, 453, 5, 5));  
  PointsArr.add(new Points(179, 453, 5, 5));
  PointsArr.add(new Points(194, 453, 5, 5));
  PointsArr.add(new Points(239, 453, 5, 5));
  PointsArr.add(new Points(254, 453, 5, 5));
  PointsArr.add(new Points(287, 453, 5, 5));
  PointsArr.add(new Points(299, 453, 5, 5));
  PointsArr.add(new Points(314, 453, 5, 5));
  PointsArr.add(new Points(329, 453, 5, 5));  
  PointsArr.add(new Points(344, 453, 5, 5));
  PointsArr.add(new Points(359, 453, 5, 5));
  PointsArr.add(new Points(374, 453, 5, 5));
  PointsArr.add(new Points(389, 453, 5, 5));  
  PointsArr.add(new Points(404, 453, 5, 5));
  PointsArr.add(new Points(419, 453, 5, 5));
  PointsArr.add(new Points(434, 453, 5, 5));
  PointsArr.add(new Points(449, 453, 5, 5));
  PointsArr.add(new Points(464, 453, 5, 5)); //BOTTOMEST DONE
  
  
  PointsArr.add(new Points(479, 306, 5, 5));//BOTTOM RIGHT SIDE
  PointsArr.add(new Points(479, 321, 5, 5));
  PointsArr.add(new Points(479, 336, 5, 5));
  PointsArr.add(new Points(479, 351, 5, 5));
  PointsArr.add(new Points(479, 366, 5, 5));
  PointsArr.add(new Points(479, 381, 5, 5));
  PointsArr.add(new Points(479, 396, 5, 5));
  PointsArr.add(new Points(479, 411, 5, 5));
  PointsArr.add(new Points(479, 426, 5, 5));
  PointsArr.add(new Points(479, 441, 5, 5));
  PointsArr.add(new Points(479, 456, 5, 5)); //BOTTOM RIGHT SIDE DONE
  
  
  
  
  
  
  PointsArr.add(new Points(183, 129, 5, 5));
  PointsArr.add(new Points(306, 129, 5, 5));
}

void draw() {
  gameStep = gameStep + 1;
  this.c = color( int(random(255)), int (random(255)), int (random(255)));
  this.c2 = color( int(random(255)), int (random(255)), int (random(255)));
  this.c3 = color( int(random(255)), int (random(255)), int (random(255)));
  if (Menu) {

    background(0);
    textSize(45);
    fill(#FEFF1C);
    text("PAC", width/4+25, height/2);
    fill(#FEFF1C);
    text("MAN", width/4+125, height/2);
    fill(#AEFE1C);
    textSize(35);
    text("Press SPACE To Play", width/4-35, height/2+40);
   


    if (key == ' ') {
      if (!Play) {
        Play = true;
        addNewPoint();
      }
    }
    
    
   
    /*if (key == 'T' || key == 't') {
      if (!Play2) {
        Play2 = true;
        addNewPoint();
      }
    }*/
    
    
    
  } else {
    Menu = false;
  }
  Play2();
  
  if (Play) {
    Play2=false;

    //print("XPosition "+Px,"  Y Postion:"+Py);
    background(0);
    stroke(0);
    fill(255);
    textSize(20);
   Ghost();
   Ghost2();
    println(Px,Py+"                       GHOST GREEN:"+x,y +"                     GHOST RED"+x2,y2);
    text("Lives "+lives, width-width+5, height-5);
    if (PointsArr.size()<=0) {
      Win=true;
    }

    textSize(30);
    fill(#f4f142);
    text(Score1, width-width+10, height-height+30);

    // fill(255, 0, 0);
   // text(Score2, width-75, height-height+30);
    fill(255);
    text((timing - floor(gameStep/60)), width/2-25, height-height+30);
    for (int i = LineArr.size()-1; i >= 0; i--) {
      Line getLine = LineArr.get(i);
      getLine.step();
    }
    

    for (int i = GhostLineArr.size()-1; i >= 0; i--) {
      LineGhost getLineGhost = GhostLineArr.get(i);
      getLineGhost.step();
    }
    for (int i = PointsArr.size()-1; i >= 0; i--) {
      Points getPoints = PointsArr.get(i);
      getPoints.step();
      boolean alive = getPoints.touched();
      if (alive) {
        PointsArr.remove(i);
      }
    }

    

    move = 2;
    move2 = 2;
    
    
    fill(#F4F142);
    ellipse(Px, Py, Ps, Ps);//PLAYER 1


    /*----------------------------------*/


    fill(255, 0, 0);
    ellipse(P2x, P2y, Ps, Ps);//PLAYER 2
    fill(255);

    if (Px<width-width) {
      Px=width;
      Py=240;
    }
    if (Px>width) {
      Px=width-width;
      Py=240;
    }
    if (Py<height-height) {
      Py=height;
    }
    if (Py>height) {
      Py=height-height;
    }

    /*---------------------------------------------------*/

    if (P2x<width-width) {
      P2x=width;
      P2y=240;
    }
    if (P2x>width) {
      P2x=width-width;
      P2y=240;
    }
    if (P2y<height-height) {
      P2y=height;
    }
    if (P2y>height) {
      P2y=height-height;
    }
    




    if (wKey) {
      go = true;
      for (int i = LineArr.size()-1; i >= 0; i--) {
        Line getLine = LineArr.get(i);
        if (!getLine.StopBall("Up", Px, Py, Ps/2)) {
          go = false;
        }
      }

      for (int i = GhostLineArr.size()-1; i >= 0; i--) {
        LineGhost getLineGhost = GhostLineArr.get(i);
        if (!getLineGhost.StopBall("Up", Px, Py, Ps/2)) {
          go = false;
        }
      }

      if (go) {
        Py=Py-move;
      }
      go = false;
    }




    if (sKey) {
      go = true;
      for (int i = LineArr.size()-1; i >= 0; i--) {
        Line getLine = LineArr.get(i);
        if (!getLine.StopBall("Down", Px, Py, Ps/2)) {
          go = false;
        }
      }
      
      
      for (int i = GhostLineArr.size()-1; i >= 0; i--) {
        LineGhost getLineGhost = GhostLineArr.get(i);
        if (!getLineGhost.StopBall("Down", Px, Py, Ps/2)) {
          go = false;
        }
      }
      
      
      if (go) {
        Py=Py+move;
      }
      go = false;
    }
    if (aKey) {
      go = true;
      for (int i = LineArr.size()-1; i >= 0; i--) {
        Line getLine = LineArr.get(i);
        if (!getLine.StopBall("Left", Px, Py, Ps/2)) {
          go = false;
        }
      }
      
      for (int i = GhostLineArr.size()-1; i >= 0; i--) {
        LineGhost getLineGhost = GhostLineArr.get(i);
        if (!getLineGhost.StopBall("Left", Px, Py, Ps/2)) {
          go = false;
        }
      }
      
      if (go) {
        Px=Px-move;
      }
      go = false;
    }
    if (dKey) {
      go = true;
      for (int i = LineArr.size()-1; i >= 0; i--) {
        Line getLine = LineArr.get(i);
        if (!getLine.StopBall("Right", Px, Py, Ps/2)) {
          go = false;
        }
      }
      
      for (int i = GhostLineArr.size()-1; i >= 0; i--) {
        LineGhost getLineGhost = GhostLineArr.get(i);
        if (!getLineGhost.StopBall("Right", Px, Py, Ps/2)) {
          go = false;
        }
      }
      
      
      if (go) {
        Px=Px+move;
      }
      go = false;
    }
  }


  //PLAYER 1
  /*---------------------------------------------------------------*/
  /*---------------------------------------------------------------*/
  /*---------------------------------------------------------------*/
  /*---------------------------------------------------------------*/
  /*---------------------------------------------------------------*/
  /*---------------------------------------------------------------*/
  /*---------------------------------------------------------------*/
  //PLAYER 2

  if (up) {
    go2 = true;
    for (int i = LineArr.size()-1; i >= 0; i--) {
      Line getLine = LineArr.get(i);
      if (!getLine.StopBall("Up", P2x, P2y, Ps/2)) {
        go2 = false;
      }
    }
    if (go2) {
      P2y=P2y-move2;
    }
    go2 = false;
  }
  if (down) {
    go2 = true;
    for (int i = LineArr.size()-1; i >= 0; i--) {
      Line getLine = LineArr.get(i);
      if (!getLine.StopBall("Down", P2x, P2y, Ps/2)) {
        go2 = false;
      }
    }
    if (go2) {
      P2y=P2y+move2;
    }
    go2 = false;
  }
  if (left) {
    go2 = true;
    for (int i = LineArr.size()-1; i >= 0; i--) {
      Line getLine = LineArr.get(i);
      if (!getLine.StopBall("Left", P2x, P2y, Ps/2)) {
        go2 = false;
      }
    }
    if (go2) {
      P2x=P2x-move2;
    }
    go2 = false;
  }
  if (right) {
    go2 = true;
    for (int i = LineArr.size()-1; i >= 0; i--) {
      Line getLine = LineArr.get(i);
      if (!getLine.StopBall("Right", P2x, P2y, Ps/2)) {
        go2 = false;
      }
    }
    if (go2) {
      P2x=P2x+move2;
    }
    go2 = false;
  }


  /*---------------------------------------------------------------*/
  /*---------------------------------------------------------------*/
  /*---------------------------------------------------------------*/
  /*---------------------------------------------------------------*/
  /*---------------------------------------------------------------*/
  /*---------------------------------------------------------------*/
  /*---------------------------------------------------------------*/
  //GHOST
  
  if ((floor(gameStep/60)) >= maxTime ) {
    GameOver = true;
  }

  
  if (inCircle(P2x, P2y, Px, Py, 30-7)) {
    lives=lives-1;
    P2x = 250;
    P2y = 275;
  }
  if (lives<=0) {
    GameOver=true;
  }
  if (GameOver) {
    move = 0;
    move2 = 0;
    background(0);

    textSize(45);
    fill(255);
    text("Game Over", width/4+20, height/2);
    text("Press R To Restart", width/7-25, height/2+50);
    textSize(22.5);
    text("Your Final Score Is "+Score1, 50, 50);
    
}


  if (Win) {
    background(0);
    textSize(45);
    fill(255);
    text("You Won", width/4+20, height/2);
    text("Press R To Restart", width/7-25, height/2+50);
    textSize(22.5);
    text("Your Final Score Is "+Score1, 50, 50);
    delay(60);
    
  }
}
