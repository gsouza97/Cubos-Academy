import 'package:pokemon/api.dart';
import 'package:pokemon/pokemon.dart';

class PokeModel {
  Future<Pokemon> _pokemon;

  Future<Pokemon> get pokemon {
    return _pokemon;
  }

  fetchPokemon(int number) {
    _pokemon = API().fetchPokemon(number);
  }
}
