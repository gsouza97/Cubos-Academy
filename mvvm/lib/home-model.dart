import 'dart:async';

class HomeModel {
  List<int> myList = [];
  Future<List<int>> lista = Future(() => []);

  loadLista() {
    lista = Future.delayed(
      Duration(seconds: 2),
      () {
        return myList..addAll(List<int>.filled(10, 1));
      },
    );
  }
}