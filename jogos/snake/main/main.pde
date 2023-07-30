Cobra cobra;
Comida comida;
int undLargura, undAltura;
int tamanhoBloco; 
int indiceDirecao;
int velocidade;
int pontos;
boolean gameover, iniciar;

void setup() {
  size(600, 600);  
  tamanhoBloco = 20;
  undLargura = width/tamanhoBloco; 
  undAltura = height/tamanhoBloco;
  comida = new Comida(int(random(0, 30)), int(random(0, 30)));  
  gameover = false;
  iniciar = false;  
  cobra = new Cobra();
  cobra.adSegmento(0, 15);
  velocidade = 10;
}

void draw() {
  background(255);
  pontos = cobra.tamanhoCobra() - 1;

  if (!gameover && iniciar) {
    cobra.desenha(tamanhoBloco);
    comida.desenha(tamanhoBloco);
    mostrarPontos();

    if (frameCount % velocidade == 0) {
      
      cobra.adMaisUmSegmento(indiceDirecao);      
      if (cobra.retornaCordSegX(0) < 0 || cobra.retornaCordSegY(0) < 0 || cobra.retornaCordSegX(0) >= undLargura || cobra.retornaCordSegY(0) >= undAltura) gameover=true;

      for (int i = 1; i < cobra.tamanhoCobra(); ++i) {
        if (cobra.retornaCordSegX(0) == cobra.retornaCordSegX(i) && cobra.retornaCordSegY(0) == cobra.retornaCordSegY(i)) {
          gameover = true;
        }
      }

      if (cobra.retornaCordSegX(0)==comida.retornaCordX() && cobra.retornaCordSegY(0)==comida.retornaCordY()) {
        if (cobra.tamanhoCobra()%2==0 && velocidade >=2) velocidade-=1; 

        comida.cordenadas((int) random(0, undLargura), (int) random(0, undAltura));
      } else {
        cobra.removeUltSegmento();
      }
    }
  } else {

    if (!iniciar) {      
      cobra.desenha(tamanhoBloco);

      if (keyCode== UP || keyCode== DOWN || keyCode== RIGHT || keyCode== LEFT) {
        iniciar = true;
      }
    } else {

      fill(219, 100, 18);
      textSize(30);
      textAlign(CENTER);
      text("GAME OVER \n Pontos: "+pontos+"\n Pressione ENTER", width/2, height/3);

      if (keyCode == ENTER) {
        cobra.zerarCobra();
        cobra.adSegmento(0,15);
        indiceDirecao = 2;
        velocidade = 10;
        gameover = false;
        iniciar = false;
        keyCode = ' '; 
      }
    }
    
  }
  
}

void keyPressed() {
  int novaDirecao = keyCode;

  switch(novaDirecao) {
  case DOWN:
    if (indiceDirecao != 1 || cobra.tamanhoCobra() == 1) {
      novaDirecao = 0;
    } else {
      novaDirecao = indiceDirecao;
    }
    break;
  case UP:
    if (indiceDirecao != 0 || cobra.tamanhoCobra() == 1) {
      novaDirecao = 1;
    } else {
      novaDirecao = indiceDirecao;
    }
    break;

  case RIGHT:
    if (indiceDirecao != 3 || cobra.tamanhoCobra() == 1) {
      novaDirecao = 2;
    } else {
      novaDirecao = indiceDirecao;
    }
    break;

  case LEFT:
    if (indiceDirecao != 2 || cobra.tamanhoCobra() == 1) {
      novaDirecao = 3;
    } else {
      novaDirecao = indiceDirecao;
    }
    break;

  default:
    novaDirecao = -1;
  }

  if (novaDirecao != -1) indiceDirecao = novaDirecao;
}

void mostrarPontos() {
  textAlign(LEFT);
  textSize(25);
  fill(150);
  text("Pontos: "+ (pontos), 10, 10, 200, 50);
}
