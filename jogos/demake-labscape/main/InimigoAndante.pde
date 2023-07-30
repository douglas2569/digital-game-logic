class InimigoAndante extends Elemento {
  boolean estadoTragetoria;

  InimigoAndante(color cor, int largura, int altura, int velocidade, int auxRandomForaTela, PImage imagem) {
    super(cor, largura, altura, velocidade, auxRandomForaTela, imagem);
    this.estadoTragetoria = parseBoolean(int(random(0, 2)));
  }

  void ficarDentroDaTela() {
    if (y < 117) {
      this.estadoTragetoria = false;
    }

    if (y > height-altura-125) {
      this.estadoTragetoria = true;
    }

    if (this.estadoTragetoria) {
      this.y-=0.5;
    } else {
      this.y+=0.5;
    }

    retornarInicio();
  }
  
}
