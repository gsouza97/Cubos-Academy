import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon/pokemon.dart';

class API {
  final _url = 'pokeapi.co';

  Future<Pokemon> fetchPokemon(int number) async {
    final response = await http.get(Uri.https(_url, '/api/v2/pokemon/$number'));

    if (response.statusCode == 200) {
      final pokemon = Pokemon.fromJson(json.decode(response.body));
      return pokemon;
    } else {
      return Future.error('Pokemon não encontrado');
    }
  }
}
