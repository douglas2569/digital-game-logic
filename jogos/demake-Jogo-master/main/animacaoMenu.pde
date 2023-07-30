final int imagem1 = 0;
final int imagem2 = 1;

int estadoAnimacao;
PImage img1, img2;
int tempo = 0;
int animacao_bolas;

void MEF() {
  if (estadoAnimacao == imagem1 ) {
    tempo++;
    if (tempo >= 10) {
      tempo = 0;
      estadoAnimacao = imagem2;
    }
  }
  if (estadoAnimacao == imagem2 ) {
    tempo++;
    if (tempo >= 10) {
      tempo = 0;
      estadoAnimacao = imagem1;
    }
  }
}

void mostraAnimacao(int estado) {
  background(0);
  if ( estado == imagem1) {
    image(img1, 0, 30, 450, 800);
  }
  if ( estado == imagem2) {
    image(img2, 0, 30, 450, 800);
  }
}
