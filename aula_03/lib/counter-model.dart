class CounterModel {
  int _contador = 0;

  int get contador {
    return _contador;
  }

  void incrementarContador() {
    _contador++;
  }

  void decrementarContador() {
    if (_contador > 0) {
      _contador--;
    }
  }
}
