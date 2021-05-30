import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:form/internal_storage.dart';

class SecureStorageAdapter extends InternalStorageAdapter{
    final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  void saveUser(String name, String surname) async {
    await secureStorage.write(
        key: 'name', value: name); //Salva o nome do usuário na chave name
    await secureStorage.write(
        key: 'surname',
        value: surname); //Salva o sobrenome do usuário na chave surnname
    print('Dados seguros');
  }

  Future<String> getFullName() async {
    String name = await secureStorage.read(key: 'name'); // Lê o nome salvo
    String surname =
        await secureStorage.read(key: 'surname'); //Lê o sobrenome salvo

    if (name != null && surname != null) {
      return '$name $surname';
    } else {
      return '';
    }
  }
}

