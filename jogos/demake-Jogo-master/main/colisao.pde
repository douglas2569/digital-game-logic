boolean verificaColisaoRetangulo(float x, float y, float largura, float altura, float xOutro, float yOutro, float lOutro, float aOutro ) {
  boolean resposta = false;

  if ( x+largura >= xOutro && x+largura <= xOutro+lOutro &&
    y+altura >= yOutro && y+altura <= yOutro+aOutro ) {
    resposta = true;
  }

  return resposta;
}


void bolinha() {
  fill(255);
  textSize(20);
  text(pontos+" % completos", 85, 30);
  yBola += velocidade;
  velocidade += aceleracao;
  image(bolinha, xBola-15, yBola-18);

  //plataforma 1
  if (verificaColisaoRetangulo(xBola, yBola, raio*2, raio*2, xplat1[2], yplat1[2]+ 15, 85, 15 ) && cores1[2] == color(#9C2020)) {
    println("game over | plataforma 1");
    velocidade = 0;
    gameOver();
  }

  if (verificaColisaoRetangulo(xBola, yBola, raio*2, raio*2, xplat1[2], yplat1[2]+ 15, 85, 15 ) && cores1[2] == color(#74B474)) {
    velocidade = -2.5;
  }

  if (verificaColisaoRetangulo(xBola, yBola, raio*2, raio*2, xplat1[2], yplat1[2]+ 15, 85, 15 ) && cores1[2] == color(0, 0, 0)) {
    println("passou direto  | plataforma 1");
    pontos = 20;
  }


  //plataforma 2
  if (verificaColisaoRetangulo(xBola, yBola, raio*2, raio*2, xplat2[2], yplat2[2]+ 15, 85, 15 ) && cores2[2] == color(#9C2020)) {
    println("game over | plataforma 2");
    velocidade = 0;
    gameOver();
  }

  if (verificaColisaoRetangulo(xBola, yBola, raio*2, raio*2, xplat2[2], yplat2[2]+ 15, 85, 15 ) && cores2[2] == color(#74B474)) {
    velocidade = -2.5;
  }

  if (verificaColisaoRetangulo(xBola, yBola, raio*2, raio*2, xplat2[2], yplat2[2]+ 15, 85, 15 ) && cores2[2] == color(0, 0, 0)) {
    println("passou direto | plataforma 2");
    pontos = 40;
  }

  //plataforma 3
  if (verificaColisaoRetangulo(xBola, yBola, raio*2, raio*2, xplat3[2], yplat3[2]+ 15, 85, 15 ) && cores3[2] == color(#9C2020)) {
    println("game over | plataforma 3");
    velocidade = 0;
    gameOver();
  }

  if (verificaColisaoRetangulo(xBola, yBola, raio*2, raio*2, xplat3[2], yplat3[2]+ 15, 85, 15 ) && cores3[2] == color(#74B474)) {
    velocidade = -2.5;
  }

  if (verificaColisaoRetangulo(xBola, yBola, raio*2, raio*2, xplat3[2], yplat3[2]+ 15, 85, 15 ) && cores3[2] == color(0, 0, 0)) {
    println("passou direto | plataforma 3");
    pontos = 60;
  }

  //plataforma 4
  if (verificaColisaoRetangulo(xBola, yBola, raio*2, raio*2, xplat4[2], yplat4[2]+ 15, 85, 15 ) && cores4[2] == color(#9C2020)) {
    println("game over | plataforma 4");
    velocidade = 0;
    gameOver();
  }

  if (verificaColisaoRetangulo(xBola, yBola, raio*2, raio*2, xplat4[2], yplat4[2]+ 15, 85, 15 ) && cores4[2] == color(#74B474)) {
    velocidade = -2.5;
  }

  if (verificaColisaoRetangulo(xBola, yBola, raio*2, raio*2, xplat4[2], yplat4[2]+ 15, 85, 15 ) && cores4[2] == color(0, 0, 0)) {
    println("passou direto | plataforma 4");
    pontos = 80;
  }

  //plataforma 5
  if (verificaColisaoRetangulo(xBola, yBola, raio*2, raio*2, xplat5[2], yplat5[2]+ 15, 85, 15 ) && cores5[2] == color(#9C2020)) {
    println("game over | plataforma 5");
    velocidade = 0;
    gameOver();
  }

  if (verificaColisaoRetangulo(xBola, yBola, raio*2, raio*2, xplat5[2], yplat5[2]+ 15, 85, 15 ) && cores5[2] == color(#74B474)) {
    velocidade = -2.5;
  }

  if (verificaColisaoRetangulo(xBola, yBola, raio*2, raio*2, xplat5[2], yplat5[2]+ 15, 85, 15 ) && cores5[2] == color(0, 0, 0)) {
    println("passou direto | plataforma 5");
    pontos = 100;
  }
  //Linha de chegada
  if (verificaColisaoRetangulo(xBola, yBola, raio*2, raio*2, 0, 785+15, 450, 15)) {
    velocidade = 0;
    ganhar();
  }
}
