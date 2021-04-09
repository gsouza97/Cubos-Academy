void main() {
  List<int> lista = [0, 1, 2, 3, 4];
  int maior = 0;
  int menor = 999;

  for (var i in lista) {
    if (i > maior) {
      maior = i;
    }
  }
  for (var i in lista) {
    if (i < menor) {
      menor = i;
    }
  }
  print('O maior número é $maior');
  print('O menor número é $menor');
}
