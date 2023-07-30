InimigoAndanteArmadura inimigos [] = new InimigoAndanteArmadura [4];
Moeda moedas [] = new Moeda [4];
InimigoBarreira inimigoBarreira;
Jogador jogador;

int auxRandomForaTela;

int num, metros, intMaiorMetros, vida, dinheiro;
boolean gameover, iniciar;
int dificuldade;

PImage cenario;
int  xCenario;

PImage jogador1, jogador2, moeda, barreira, menuInicial, menuInicial2, displayPontos, ImgGameOver;
PImage[] inimigoAndante = new PImage[4];

PFont fontAtari;

void setup() {
  size(820, 640);
  frameRate(30);
  noStroke();
  imageMode(CORNER);

  fontAtari = createFont("fonte/fontAtari.ttf", 128);  
  textFont(fontAtari);

  configuracoesIniciais();
  iniciar = false;
}


void draw() {
  background(255);

  if (!gameover && iniciar) {

    jogo();

    if (vida<=0) gameover=true;
  } else {

    if (!iniciar) {

      telaInicial();

      if (keyCode== ENTER) {
        iniciar = true;
        textSize(12);
        keyCode = ' ';
      }
    } else {
      telaFinal();

      if (keyCode == ENTER) {

        keyCode = ' ';

        configuracoesIniciais();
      }
    }
  }
}

void mousePressed() {
  jogador.estadoYPlayer = true;
}

void mouseReleased() {
  jogador.estadoYPlayer = false;
}

void jogo() {

  cenario();

  infoTela();

  jogador.mostrar();

  for (int i =0; i<inimigos.length; ++i) {
    inimigos[i].mostrar();
  }

  inimigoBarreira.mostrar();

  for (int i =0; i<moedas.length; ++i) {
    moedas[i].desenhar();
  }


  if (frameCount%120 == 0) {//4s = 1m
    ++metros;
  }
  if (frameCount%dificuldade == 0) if (vida > 0)--vida;
  if (frameCount%(120*4) == 0 && dificuldade >= 3) --dificuldade;

  sortearInimigo();
  

  for (int i =0; i<inimigos.length; ++i) {
    if (inimigos[i].verificaColisaoRetangulo(jogador.x, jogador.y, jogador.largura, jogador.altura) && !inimigos[i].escudo && !inimigos[i].capacete) {
      inimigos[i].irParaFinal();
      if (vida + 20 <= 100 ) {
        vida += 20;
      } else {
        vida = 100;
      }
    } else if (inimigos[i].verificaColisaoRetangulo(jogador.x, jogador.y, jogador.largura, jogador.altura) && inimigos[i].escudo && !inimigos[i].capacete) {
      inimigos[i].escudo = false;
      inimigos[i].cor = color(100, 100, 225);
      inimigos[i].x += 100;
    } else if (inimigos[i].verificaColisaoRetangulo(jogador.x, jogador.y, jogador.largura, jogador.altura) && inimigos[i].escudo && inimigos[i].capacete) {
      inimigos[i].capacete = false;
      inimigos[i].cor = color(150, 150, 0);
      inimigos[i].x += 100;
    }
  }
  
  if (jogador.verificaColisaoRetangulo(inimigoBarreira.x, inimigoBarreira.y, inimigoBarreira.largura, inimigoBarreira.altura)) {
    
    vida = 0;
    gameover = true;
  }

  //verifica se a moeda colidiu com 0 jogador
  for (int i =0; i<moedas.length; ++i) {
    if (moedas[i].verificaColisaoRetangulo(jogador.x, jogador.y, jogador.largura, jogador.altura)) {
      moedas[i].irParaFinal();
      ++dinheiro;
    }
  }

  //verificando se o inimigo colidiu com a barreira
  for (int i =0; i<inimigos.length; ++i) {

    if (inimigos[i].verificaColisaoRetangulo(inimigoBarreira.x, inimigoBarreira.y, inimigoBarreira.largura, inimigoBarreira.altura)) {
      inimigos[i].irParaFinal();
    }
  }

  if (metros > intMaiorMetros) {
    intMaiorMetros = metros;
  }
}

void infoTela() {
  fill(136, 0, 0);
  rect(215, 14, (vida/100.0)*385, 26);

  textSize(16);
  fill(255);
  text("+", 220, 35);
  text(vida+"/100", 383, 35);   
  fill(255);
  textSize(20);
  text(metros+"m", 388, 86);  
  textSize(30);
  text(""+dinheiro, width-110, 48);
}
boolean estadoTelaInicial = false;

void telaInicial() {

  if (frameCount % 10 == 0) {
    estadoTelaInicial = true;
  } 

  if (frameCount % 20 == 0) {
    estadoTelaInicial = false;
  }
  if (estadoTelaInicial) {
    image(menuInicial, 0, 0);
  }

  if (!estadoTelaInicial) {
    image(menuInicial2, 0, 0);
  }
}

void telaFinal() {
  image(ImgGameOver, 0, 0);
  textSize(20);
  fill(0);
  text("RESULT!", width/2-59, 170);

  textSize(9);
  fill(255);
  text("Distance", width/2-96, 200);
  text("Best Score", width/2+12, 200);
  textSize(17);  
  text(metros+"m", width/2-85, 240);  
  text(intMaiorMetros+"m", width/2+30, 240);
  textSize(9);
  text("Coin", width/2-20, 285);
  textSize(22);  
  text(""+dinheiro, width/2+35, 330);

  image(moeda, width/2-100, 308);
  textSize(20);
  fill(0);
  text("PRESS ENTER", width/2-110, 430);
}

void configuracoesIniciais() {

  cenario =loadImage("imgs/cenario.png");
  xCenario=0;

  displayPontos =loadImage("imgs/display_pts_2.png");

  jogador1 = loadImage("imgs/jogador.png");
  jogador2 = loadImage("imgs/jogador2.png");
  inimigoAndante[0] =loadImage("imgs/inimigo_andante_2.png");
  inimigoAndante[1] =loadImage("imgs/inimigo_escudo.png");
  inimigoAndante[2] =loadImage("imgs/inimigo_escudo_capacete.png");
  inimigoAndante[3] =loadImage("imgs/inimigo_andante_1.png");
  moeda =loadImage("imgs/moeda.png");
  barreira =loadImage("imgs/barreira.png");
  menuInicial  = loadImage("imgs/tela_menu_inicial.png");
  menuInicial2 = loadImage("imgs/tela_menu_inicial2.png");

  ImgGameOver = loadImage("imgs/gameover.png");

  for (int i =0; i<inimigos.length; ++i) {
    auxRandomForaTela += int (random (100, 300));
    inimigos[i] = new InimigoAndanteArmadura(color(100, 100, 225), 62, 70, 3, auxRandomForaTela, false, false, false, inimigoAndante);
  }

  inimigoBarreira = new InimigoBarreira(color(100, 255, 100), barreira.width, barreira.height, 1, auxRandomForaTela, barreira);

  jogador = new Jogador(color(255, 100, 100), jogador1.width, jogador1.height, jogador1, jogador2);


  auxRandomForaTela = 0;
  for (int i =0; i<moedas.length; ++i) {
    auxRandomForaTela += int (random (100, 300));
    moedas[i] = new Moeda(color(200, 200, 0), moeda.width, 2, auxRandomForaTela, moeda);
  }

  metros= 0;
  vida = 100;
  dificuldade = 10;
  gameover = false;
}

void sortearInimigo() {

  if (metros >= 7 && metros < 11) {// 1m = 4s | 7m | escudo
    for (int i =0; i<inimigos.length; ++i) {
      num = int(random(0, 4));
      if (inimigos[i].x < -(inimigos[i].largura+10)) {

        switch(num) {
        case 0:
          inimigos[i] = new InimigoAndanteArmadura(color(100, 100, 225), 62, 70, 3, auxRandomForaTela, false, false, false, inimigoAndante);
          break;
        case 1:
          inimigos[i] = new InimigoAndanteArmadura(color(150, 150, 0), 62, 70, 3, auxRandomForaTela, true, false, false, inimigoAndante);
          break;

        case 2:
          inimigos[i] = new InimigoAndanteArmadura(color(150, 150, 0), 62, 70, 3, auxRandomForaTela, true, false, false, inimigoAndante);
          break;

        case 3:
          inimigos[i] = new InimigoAndanteArmadura(color(100, 100, 225), 62, 70, 3, auxRandomForaTela, false, false, false, inimigoAndante);
          break;
        }
      }
    }
  } else if (metros >= 12) {

    for (int i =0; i<inimigos.length; ++i) {
      num = int(random(0, 5));
      if (inimigos[i].x < -(inimigos[i].largura+10)) {

        switch(num) {
        case 0:
          inimigos[i] = new InimigoAndanteArmadura(color(100, 100, 225), 62, 70, 3, auxRandomForaTela, false, false, false, inimigoAndante);
          break;
        case 1:
          inimigos[i] = new InimigoAndanteArmadura(color(150, 150, 0), 62, 70, 3, auxRandomForaTela, true, false, false, inimigoAndante);
          break;
        case 2:
          inimigos[i] = new InimigoAndanteArmadura(color(0, 150, 150), 62, 70, 3, auxRandomForaTela, true, true, false, inimigoAndante);
          break;

        case 3:
          inimigos[i] = new InimigoAndanteArmadura(color(0, 150, 150), 62, 70, 3, auxRandomForaTela, true, true, false, inimigoAndante);
          break;

        case 4:
          inimigos[i] = new InimigoAndanteArmadura(color(100, 100, 225), 62, 70, 3, auxRandomForaTela, false, false, false, inimigoAndante);
          break;
        }
      }
    }
  }
}
void cenario() {

  image(cenario, xCenario, 0);
  image(cenario, xCenario+cenario.width, 0);
  xCenario -= 5;
  if (xCenario <= -814) xCenario = 0;

  image(displayPontos, 0, 0);
}
