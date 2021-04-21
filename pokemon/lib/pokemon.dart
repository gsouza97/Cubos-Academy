class Pokemon {
  String name;
  String imageUrl;
  int weight;
  int height;
  int id;
  String type;
  String ability1;
  String ability2;

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['sprites']['other']["official-artwork"]['front_default'];
    weight = json['weight'];
    height = json['height'];
    id = json['id'];
    type = json['types'][0]['type']['name'];
    ability1 = json['abilities'][0]['ability']['name'];
    ability2 = json['abilities'][1]['ability']['name'];
  }
}
