class Pokemon {
  String name;
  String imageUrl;
  int weight;
  int height;
  int id;
  String type;
  String ability1;
  String ability2;
  List<Ability> abilities;

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['sprites']['other']["official-artwork"]['front_default'];
    weight = json['weight'];
    height = json['height'];
    id = json['id'];
    type = json['types'][0]['type']['name'];

    var listAbilities = json['abilities'] as List;
    abilities =
        listAbilities.map((e) => Ability.fromJson(e['ability'])).toList();

    print(listAbilities);
    print(abilities);
  }
}

class Ability {
  String name;
  String url;

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
