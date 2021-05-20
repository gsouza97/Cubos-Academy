import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/poke-model.dart';
import 'package:pokemon/api.dart';
import 'package:pokemon/pokemon.dart';

void main() {
  test('FetchPokemon fill pokemon variable', () {
    // Prep
    final model = PokeModel(api: MockAPI());

    //Exec
    model.fetchPokemon(3);

    // Result
    expect(model.pokemon, completion(isNotNull));

    model.pokemon.then((pokemon) {
      expect(pokemon.name, 'Find');
    });
  });
}

class MockAPI extends API {
  @override
  Future<Pokemon> fetchPokemon(int number) {
    final pokemon = Pokemon(name: 'Find', imageUrl: 'null', abilities: []);
    return Future.value(pokemon);
  }
}
