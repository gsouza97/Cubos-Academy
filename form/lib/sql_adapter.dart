import 'package:form/internal_storage.dart';
import 'package:form/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLAdapter extends InternalStorageAdapter {
  static Database _database;

  // Função para pegar o banco de dados
  // Verifica se já existe o banco de dados
  // Caso nao exista, espera inicializar pela função InitDB
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDB();
      print(_database.path);
      return _database;
    }
  }

  // Inicialização do Banco de Dados
  // Pega o path (caminho pra salvar o DB) e cria o database passando o nome com final .db
  // Pede pra retornar um database de acordo com o path.
  // O opendatabase tenta abrir um banco de dados. Se existir, retorna o banco de dados.
  // Caso nao exista, executa o onCreate e cria um banco de dados passando a query SQL.
  initDB() async {
    String path = join(await getDatabasesPath(), 'user_database.db');

    return await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute('CREATE TABLE Users(name TEXT, surname TEXT)');
      },
      version: 1,
    );
  }

  // Função para pegar o nome completo
  @override
  Future<User> getUser() async {
    final Database db = await database;

    var response = await db.query(
      'Users',
      columns: ['rowid', 'name', 'surname'],
      // where: 'rowid = ?',
      // whereArgs: ['2']
    );

    if (response.isNotEmpty) {
      final User user = User.fromMap(response.last);
      print(user.name);
      return user;
    } else {
      return null;
    }
  }

  // Função para salvar o usuário
  @override
  void saveUser(String name, String surname) async {
    final Database db = await database;

    await db.insert('Users', {'name': name, 'surname': surname});
    print('Usuário salvo no DB');
    print('$name $surname');
  }

  // Função para deletar o usuário
  @override
  void deleteUser(User user) async {
    final Database db = await database;

    await db.delete('Users', where: 'rowid = ?', whereArgs: [user.rowid]);
    print('Usuário deletado');
  }
}
