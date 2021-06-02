class User {
  String name;
  String surname;
  int rowid;
  String fullName;

  User({this.name, this.surname, this.rowid, this.fullName});

  User.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        surname = map['surname'],
        rowid = map['rowid'];

  Map<String, dynamic> toMap() {
    return {'name': name, 'surname': surname, 'rowid': rowid};
  }
}
