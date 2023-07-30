int contador = -1;
int[] indices2 = new int[5];
int[] indices3 = new int[5];
int[] indices4 = new int[5];
int[] indices5 = new int[5];

boolean sortearIndice(int[] indices, color[] cores) {
  int indice;
  do {
    indice = int(random(0, 5));

    if (verificarTodos(indices)) break;
  } while (verificarUm(indice, indices));

  if (!verificarTodos(indices)) {
    ++contador;
    indices[contador] = indice;
  }

  if (verificarTodos(indices)) {
    for (int i=0; i < 5; ++i) {

      switch(indices[i]) {
      case 0:
        cores[i] = color(#74B474);
        break;

      case 1:
        cores[i] = color(#9C2020);
        break;

      case 2:
        cores[i] = color(#74B474);
        break;

      case 3:
        cores[i] = color(#9C2020);
        break;

      case 4:
        cores[i] = color(0, 0, 0);
        break;
      }
    }
    contador = -1;
  }

  return !verificarTodos(indices);
}

//verifica se todos os indices foram sorteados.
boolean verificarTodos(int[] indices) {
  for (int i=0; i < 5; ++i) {
    if (indices[i] == -1) {
      return false;
    }
  }

  return true;
}

//verifica se um indice especifico foi sorteado
boolean verificarUm(int indice, int[]indices) {
  for (int i=0; i < 5; ++i) {
    if (indices[i] == indice) {
      return true;
    }
  }

  return false;
}
