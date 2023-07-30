//VARIÁVEIS E ARRAYS

float [] xplat1 = new float [5];
float [] yplat1 = new float [5];

float [] xplat2 = new float [5];
float [] yplat2 = new float [5];

float [] xplat3 = new float [5];
float [] yplat3 = new float [5];

float [] xplat4 = new float [5];
float [] yplat4 = new float [5];

float [] xplat5 = new float [5];
float [] yplat5 = new float [5];

color [] cores1 = new color [5];
color [] cores2 = new color [5];
color [] cores3 = new color [5];
color [] cores4 = new color [5];
color [] cores5 = new color [5];

float xBola;
float yBola;

float x, y, raio;
float aceleracao, velocidade;

PImage bolinha;
PImage plat;
PImage linhaDeChegada;

PFont fonteAtari;

int pontos;

boolean start, gameOver, menu, ganhar;

void setup() {
  size(450, 800);
  textAlign(CENTER);
  noStroke();
  menu = true;
  start = false;
  gameOver = false;
  ganhar = false;
  iniciar();

  bolinha = loadImage("imgs/bolinhaa.png");
  plat = loadImage("imgs/plat.png");
  linhaDeChegada = loadImage ("imgs/linhadechegada.png");

  fonteAtari = createFont("fonts/Minecraft.ttf", 30);

  estadoAnimacao = animacao_bolas;
  img1 = loadImage("imgs/menu1.png");
  img2 = loadImage("imgs/menu2.png");
}

void iniciar() {
  pontos = 0;
  for (int i=0; i < 5; ++i) {
    indices2[i] = -1;
    indices3[i] = -1;
    indices4[i] = -1;
    indices5[i] = -1;
  }

  cores1[0] = color(#74B474);
  cores1[1] = color(#9C2020);
  cores1[2] = color(#74B474);
  cores1[3] = color(#9C2020);
  cores1[4] = color(0, 0, 0);

  while (sortearIndice(indices2, cores2));
  while (sortearIndice(indices3, cores3));
  while (sortearIndice(indices4, cores4));
  while (sortearIndice(indices4, cores4));
  while (sortearIndice(indices5, cores5));

  // PARAMETRIZA PLATAFORMAS
  for (int i = 0; i< 5; i++) {
    xplat1[i] = i*85;
    yplat1[i] = 200 + 0*120;

    xplat2[i] = i*85;
    yplat2[i] = 200 + 1*120;

    xplat3[i] = i*85;
    yplat3[i] = 200 + 2*120;

    xplat4[i] = i*85;
    yplat4[i] = 200 + 3*120;

    xplat5[i] = i*85;
    yplat5[i] = 200 + 4*120;
  }

  //BOLINHA
  raio = 15;

  x = 225;
  y = 180;

  xBola = x;
  yBola = y - raio;
  velocidade = -2;
  aceleracao = 0.1;
}

void draw() {
  background(0);
  noStroke();
  if (start) {
    game();
  } else if (menu) {
    menu();
  } else if (gameOver) {
    gameOver();
  } else if (ganhar) {
    ganhar();
  }
}
void menu () {
  mostraAnimacao(estadoAnimacao);
  MEF();
  textFont(fonteAtari);
  text("PRESS", width/2.2, height/3*2);
  text("SPACE", width/1.72, height/3*2.12);
  textSize(100);
  text("HELIX", width/2.2, height/7);
  text("JUMP", width/1.6, height/4);
  textSize(10);
  text("SMD 2600", width/1.18, height/4);

  gameOver = false;
  start = false;
  menu = true;
}

void game() {
  background(0);
  gameOver = false;
  start = true;
  menu = false;
  plataformas();
  bolinha();
}

void gameOver() {
  background(#9C2020);
  textSize(30);
  text("PRESS ENTER", width/2, height/3*2.2);
  text("TO RESTART ", width/2, height/3*2.33);
  textSize(40);
  text(pontos+" % completos", width/2, height/2);
  text("GAME OVER", width/2, height/4*1.2);
  gameOver = true;
  start = false;
  menu = false;
}

void ganhar() {
  background(#74B474);
  textSize(30);
  text("PRESS ENTER", width/2, height/3*2.2);
  text("TO RESTART ", width/2, height/3*2.33);
  textSize(40);
  text(pontos+" % completos", width/2, height/2);
  text("CONGRATULATIONS!", width/2, height/4*1.2);
  textSize(70);
  text("WINNER", width/2, height/4);
  gameOver = false;
  start = false;
  menu = false;
  ganhar = true;
}
