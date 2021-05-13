import 'dart:async';

import 'package:mvvm/home-model.dart';

class HomeViewModel {
  HomeModel _model = HomeModel();

  // Criação do stream para a lista
  StreamController<List<int>> streamLista = StreamController();

  void loadLista() {
    _model.loadLista();
    _model.lista.then((value) => streamLista
        .add(value)); // Notifica toda vez que chegar um valor novo na lista
  }
}
