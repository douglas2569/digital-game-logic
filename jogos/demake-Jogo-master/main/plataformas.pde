
void plataformas() {
  fill(255);

  for (int i=0; i < 5; ++i) {
    fill(cores1[i]);
    rect(xplat1[i]+12, yplat1[i], 85, 15);
    image(plat, xplat1[i]+12, yplat1[i]);

    fill(cores2[i]);
    rect(xplat2[i]+12, yplat2[i], 85, 15);
    fill(0);
    rect(xplat2[i]+16, yplat2[i]+1.5, 75, 12);

    fill(cores3[i]);
    rect(xplat3[i]+12, yplat3[i], 85, 15);
    image(plat, xplat3[i]+12, yplat3[i]);

    fill(cores4[i]);
    rect(xplat4[i]+12, yplat4[i], 85, 15);
    fill(0);
    rect(xplat4[i]+16, yplat4[i]+1.5, 75, 12);

    fill(cores5[i]);
    rect(xplat5[i]+12, yplat5[i], 85, 15);
    image(plat, xplat5[i]+12, yplat5[i]);

    image(linhaDeChegada, 0, 785);
  }
}
