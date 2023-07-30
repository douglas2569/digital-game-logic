class InimigoAndanteArmadura extends InimigoAndante {
  boolean escudo;
  boolean capacete;
  boolean armado, estadoAlternarImg;

  PImage[] imagem;

  InimigoAndanteArmadura(color cor, int largura, int altura, int velocidade, int auxRandomForaTela, boolean escudo, boolean capacete, boolean armado, PImage[] imagem) {
    super(cor, largura, altura, velocidade, auxRandomForaTela, imagem[0]);
    this.escudo = escudo;
    this.capacete = capacete;
    this.armado = armado;
    this.imagem = imagem;
    this.estadoAlternarImg = true;
  }

  void mostrar() {
    this.desenhar();
    if (!this.escudo && !this.capacete) {
      this.ficarDentroDaTela();
    }
    this.moverParaEsquerda();
  } 

  void desenhar() {
    if (escudo && capacete) {
      image(this.imagem[2], x, y);
    } else if (escudo && !capacete) {
      image(this.imagem[1], x, y);
    } else {

      if (frameCount % 10 == 0) {
        estadoAlternarImg = true;
      } 

      if (frameCount % 20 == 0) {
        estadoAlternarImg = false;
      }
      if (estadoAlternarImg) {
        image(this.imagem[0], x, y);
      }

      if (!estadoAlternarImg) {
        image(this.imagem[3], x, y);
      }
    }
  }
}
