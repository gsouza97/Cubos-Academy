import 'package:form/internal_storage.dart';
import 'package:form/secure_storage_adapter.dart';
import 'package:form/shared_preferences_adapter.dart';

class FormModel {
  String name;
  String surname;
  final InternalStorageAdapter internalStorage;

  FormModel({InternalStorageAdapter internalStorageAdapter})
      : internalStorage = internalStorageAdapter ?? SharedPreferencesAdapter();

  void save() {
    if (name != null && surname != null) {
      internalStorage.saveUser(name, surname);
    } else {
      return;
    }
  }

  Future<String> getFullName() {
    return internalStorage.getFullName();
  }
}
