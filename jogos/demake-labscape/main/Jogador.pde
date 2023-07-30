class Jogador {
  boolean estadoYPlayer;
  float x, y;
  int largura, altura;
  color cor;
  PImage imagem1, imagem2;
  boolean estadoAlternarImg;

  final int ANDANDO1 = 0;
  final int ANDANDO2 = 1;

  int estadoAnimacao;
  int tempoAnimacao;

  Jogador(color cor, int largura, int altura, PImage imagem1, PImage imagem2) {
    this.x = 0;
    this.y=height/2;
    this.estadoYPlayer = false;
    this.cor = cor;
    this.largura = largura;
    this.altura = altura;
    this.imagem1 = imagem1;
    this.imagem2 = imagem2;
    this.estadoAlternarImg = true;
    this. estadoAnimacao = ANDANDO1;
    this. tempoAnimacao = 0;
  }

  void ficarDentroDaTela() {
    if (y >= height - altura-125) {
      y = height - altura-125;
    }
    if (y < 117) {
      y = 117;
    }
  }

  void andandoVertical() {
    if (x <= width/4-largura) {//Faz o jogador andar um quarto de tela pra direita antes de começar o jogo 
      x+=10;
    } else {
      if (estadoYPlayer) {// Responsável pelo movimento do jogador pra cima e pra baixo 
        y-= 6;
      } else {
        y+= 6;
      }
    }
  }

  void desenhar() {

    if (estadoAnimacao == ANDANDO1) {
      image(this.imagem1, x, y);
    } else if (estadoAnimacao == ANDANDO2) {
      image(this.imagem2, x, y);
    }
  }

  void MEFAnimacao() {

    if (estadoAnimacao == ANDANDO1) {
      tempoAnimacao++;
      if (tempoAnimacao >= 8) {
        tempoAnimacao=0;
        estadoAnimacao = ANDANDO2;
      }
    }

    if (estadoAnimacao == ANDANDO2) {
      tempoAnimacao++;
      if (tempoAnimacao >= 8) {
        tempoAnimacao=0;
        estadoAnimacao = ANDANDO1;
      }
    }
  }


  void mostrar() {
    MEFAnimacao();
     
    this.desenhar();
    this.andandoVertical();
    this.ficarDentroDaTela();
  }

  // l = largura, a = altura
  boolean verificaColisaoRetangulo(float xOutro, float yOutro, float lOutro, float aOutro ) {
    boolean resposta = false;

    if ( this.x+this.largura >= xOutro && this.x+this.largura <= xOutro+lOutro && 
      this.y>= yOutro && this.y <= yOutro+aOutro ) {
      resposta = true;
    } else if ( this.x <= xOutro+lOutro && this.x >= xOutro &&
      this.y >= yOutro && this.y <= yOutro+aOutro ) {
      resposta = true;
    } else if ( this.x <= xOutro+lOutro && this.x >= xOutro &&
      this.y+this.altura >= yOutro && this.y+this.altura  <= yOutro+aOutro ) {
      resposta = true;
    } else if ( this.x+this.largura >= xOutro && this.x+this.largura <= xOutro+lOutro &&
      this.y+this.altura >= yOutro && this.y+this.altura <= yOutro+aOutro ) {
      resposta = true;
    }

    return resposta;
  }

  boolean verificaColisaoCirculo(float xOutro, float yOutro, float lOutro) {
    boolean resposta = false;

    if ( dist(this.x+largura/2, this.y+altura/2, xOutro, yOutro) <=  (largura/2)+(lOutro/2)) {
      resposta = true;
    } 

    return resposta;
  }
}
