class Elemento {
  float x, y, auxRandomForaTela;
  int largura, altura, velocidade;
  color cor;
  PImage imagem;
  
  Elemento(color cor, int largura, int altura, int velocidade, int auxRandomForaTela, PImage imagem) {
    this.cor = cor;
    this.largura = largura;
    this.altura = altura;
    this.velocidade = velocidade;
    this.auxRandomForaTela = auxRandomForaTela;

    this.x = width + this.auxRandomForaTela;
    this.y = random(110, height-altura-125);
    this.imagem = imagem;
  }

  void moverParaEsquerda() {
    this. x-=this.velocidade;
  }

  void desenhar() {   
    image(this.imagem, x, y);
  }

  void retornarInicio() {    
    if (this.x < -(this.largura+10)) {       
      this.x = width + this.auxRandomForaTela;     
      this.y = random(117, height-altura-125);
    }
  }

  void irParaFinal() {  
    this.x = -(this.largura+10);
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
