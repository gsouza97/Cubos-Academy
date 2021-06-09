import 'package:selfie/form_model.dart';

class FormViewModel {
  final _model = FormModel();
  String get name => _model.name;
  String get surname => _model.surname;

  updateName(String name) {
    _model.name = name;
  }

  updateSurname(String surname) {
    _model.surname = surname;
  }

  showCamera(context) {
    _model.showCamera(context);
  }
}
