class Cobra {
  ArrayList<Integer> x;
  ArrayList<Integer> y; 
  int []x_direcao;
  int []y_direcao;

  Cobra() {
    x = new ArrayList<Integer>();
    y = new ArrayList<Integer>();
    x_direcao = new int[4];
    y_direcao = new int[4];
    
    x_direcao[0] = 0;
    x_direcao[1] = 0;
    x_direcao[2] = 1;
    x_direcao[3] = -1;
    y_direcao[0] = 1;
    y_direcao[1] = -1;
    y_direcao[2] = 0;
    y_direcao[3] = 0;
  }

  void adMaisUmSegmento(int indiceDirecao) {
    println(indiceDirecao);
    println(x.get(0), y.get(0));
    x.add(0, x.get(0) + x_direcao[indiceDirecao]);
    y.add(0, y.get(0) + y_direcao[indiceDirecao]);    
  }
  
  void adSegmento(int a, int b) {
    x.add(a);
    y.add(b);
  }

  void removeUltSegmento() {
    x.remove(x.size()-1);
    y.remove(y.size()-1);
  }


  void desenha(int tamanhoBloco) {
    fill(100, 255, 100);
    for (int i = 0; i < x.size(); ++i) {
      rect(x.get(i)*tamanhoBloco, y.get(i)*tamanhoBloco, tamanhoBloco, tamanhoBloco);
    }
  }

  int retornaCordSegX(int indice) {

    return x.get(indice);
  }

  int retornaCordSegY(int indice) {

    return y.get(indice);
  }

  int tamanhoCobra() {

    return x.size();
  }
  
  void zerarCobra() {

    x.clear();
    y.clear();
  }
}
