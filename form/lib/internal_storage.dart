import 'package:form/user.dart';

abstract class InternalStorageAdapter {
  void saveUser(String name, String surname);
  Future<User> getUser();
  void deleteUser(User user);
}