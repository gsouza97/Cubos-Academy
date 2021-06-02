import 'package:form/internal_storage.dart';
import 'package:form/secure_storage_adapter.dart';
import 'package:form/shared_preferences_adapter.dart';
import 'package:form/sql_adapter.dart';
import 'package:form/user.dart';

class FormModel {
  Future<User> user;

  String name;
  String surname;
  int rowId;

  final InternalStorageAdapter internalStorage;

  FormModel({InternalStorageAdapter internalStorageAdapter})
      : internalStorage = internalStorageAdapter ?? SQLAdapter();

  void saveUser() {
    if (name != null && surname != null) {
      internalStorage.saveUser(name, surname);
    }
  }

  void deleteUser(User user) {
    if (user != null) {
      internalStorage.deleteUser(user);
    }
  }

  Future<User> getUser() {
    return internalStorage.getUser();
  }
}
