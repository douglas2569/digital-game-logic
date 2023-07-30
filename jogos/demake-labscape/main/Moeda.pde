class Moeda extends Elemento{
  
  Moeda(color cor, int largura,  int velocidade, int auxRandomForaTela, PImage imagem) {
    super(cor, largura, largura, velocidade, auxRandomForaTela, imagem);    
  }
  
  void desenhar() {    
    image(this.imagem, x, y);
    moverParaEsquerda();
    retornarInicio();
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
 
    
}
