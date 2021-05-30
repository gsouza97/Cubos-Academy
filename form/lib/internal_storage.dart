abstract class InternalStorageAdapter {
  void saveUser(String name, String surname);
  Future<String> getFullName();
}