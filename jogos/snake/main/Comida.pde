class Comida {
  int x_comida;
  int y_comida;

  Comida(int x, int y) {
    this.x_comida = x;
    this.y_comida = y;
  }

  void desenha(int tamanhoBloco) {
    fill(200, 100, 100);
    rect(this.x_comida*tamanhoBloco, this.y_comida*tamanhoBloco, tamanhoBloco, tamanhoBloco);
  }

  int retornaCordX() {  
    return this.x_comida;
  }
  
  int retornaCordY() {  
    return this.y_comida;
  }
  
  void cordenadas(int x, int y) {  
    this.x_comida = x;
    this.y_comida = y;
  }
}
