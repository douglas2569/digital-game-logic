class InimigoBarreira extends Elemento {
  int metrosBarreira;
  boolean estadoMostrarBarreira;

  InimigoBarreira(color cor, int largura, int altura, int velocidade, int auxRandomForaTela, PImage imagem) {
    super(cor, largura, altura, velocidade, auxRandomForaTela, imagem);    
    this.estadoMostrarBarreira = false;
    this.metrosBarreira = 30;
  }

  void mostrar() {
    if (frameCount % this.metrosBarreira == 0) {
      this.estadoMostrarBarreira = true;
    }

    if (this.estadoMostrarBarreira) {
      this.desenhar();
      this.moverParaEsquerda();
      this.retornarInicio();
    }
  }

  void retornarInicio() {
    if (this.x <-this.largura) { 
      this.x = width + int (random (100, 300));
      this.y = random(117, height-altura-125);
      this.estadoMostrarBarreira = false;
      this.metrosBarreira = int(random(480, 600));
    }
  }
}
