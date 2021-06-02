//import 'package:form/internal_storage.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//
//class SharedPreferencesAdapter extends InternalStorageAdapter{
//  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//
//  void saveUser(String name, String surname) async {
//    final internalPref = await _prefs;
//    internalPref.setString('name', name);
//    internalPref.setString('surname', surname);
//    print('Dados salvos');
//  }
//
//  Future<String> getFullName() async {
//    final internalPref = await _prefs;
//    String name = internalPref.getString('name');
//    String surname = internalPref.getString('surname');
//
//    if (name != null && surname != null) {
//      return '$name $surname';
//    } else {
//      return '';
//    }
//  }
//}
