import 'dart:async';
import 'dart:math';

import 'package:pokemon/poke-model.dart';

class PokeViewModel {
  final _model = PokeModel();

  StreamController pokemonStream = StreamController();

  loadPokemon() {
    _model.fetchPokemon(Random().nextInt(150));
    _model.pokemon.then((value) => pokemonStream.add(value));
  }
}
