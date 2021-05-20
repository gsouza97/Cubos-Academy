import 'package:pokemon/api.dart';
import 'package:pokemon/pokemon.dart';

class PokeModel {
  Future<Pokemon> _pokemon;
  final API api;

  PokeModel({this.api = const API()});

  Future<Pokemon> get pokemon {
    return _pokemon;
  }

  fetchPokemon(int number) {
    _pokemon = api.fetchPokemon(number);
  }
}
