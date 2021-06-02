import 'dart:async';

import 'package:form/form_model.dart';
import 'package:form/user.dart';

class FormController {
  final model = FormModel();

  String get name => model.name;
  String get surname => model.surname;
  Future<User> get user => model.getUser();

  //StreamController fullNameStream = StreamController();

  void getUser() {
    model.getUser();
    //model.user.then((value) => fullNameStream.add(value));
  }

  void updateName(String name) {
    model.name = name;
  }

  void updateSurname(String surname) {
    model.surname = surname;
  }

  void deleteUser(User user) {
    model.deleteUser(user);
  }

  void saveUser() {
    model.saveUser();
  }
}
