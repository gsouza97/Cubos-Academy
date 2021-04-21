import 'dart:math';

import 'package:pokemon/poke-model.dart';
import 'package:pokemon/pokemon.dart';

class PokeController {
  final model = PokeModel();

  Future<Pokemon> get pokemon {
    return model.pokemon;
  }

  loadPokemon() {
    model.fetchPokemon(Random().nextInt(150));
  }
}
