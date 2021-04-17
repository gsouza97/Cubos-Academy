import 'package:aula_03/counter-model.dart';

class CounterController {
  final model = CounterModel();

  String getContador() {
    return model.contador.toString();
  }

  void incrementarContador() {
    model.incrementarContador();
  }

  void decrementarContador() {
    model.decrementarContador();
  }
}
