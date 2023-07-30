// Altera as cores e não as posições das plataformas

void keyReleased() {

  if  (keyCode == RIGHT) {
    inverterCoresDireita(cores1);
    inverterCoresDireita(cores2);
    inverterCoresDireita(cores3);
    inverterCoresDireita(cores4);
    inverterCoresDireita(cores5);
  }
  if (keyCode == LEFT) {
    inverterCoresEsquerda(cores1);
    inverterCoresEsquerda(cores2);
    inverterCoresEsquerda(cores3);
    inverterCoresEsquerda(cores4);
    inverterCoresEsquerda(cores5);
  }
  if (keyCode == ' ' && menu) {
    gameOver = false;
    start = true;
    menu = false;
  }
  if (keyCode == ENTER && gameOver) {
    gameOver = false;
    start = false;
    menu = true;
    iniciar();
  }
  if (keyCode == ENTER && ganhar) {
    gameOver = false;
    start = false;
    menu = true;
    iniciar();
  }
}

color corAux;
void inverterCoresDireita(color[] cores) {
  corAux = cores[0];
  cores[0] = cores[1];
  cores[1] = cores[2];
  cores[2] = cores[3];
  cores[3] = cores[4];
  cores[4] = corAux;
}

void inverterCoresEsquerda(color[] cores) {
  corAux = cores[0];
  cores[0] = cores[4];
  cores[4] = cores[3];
  cores[3] = cores[2];
  cores[2] = cores[1];
  cores[1] = corAux;
}
