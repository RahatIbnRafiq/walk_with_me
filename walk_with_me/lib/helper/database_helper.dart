import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:walk_with_me/models/audio.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'audios.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE audios(
          name TEXT,
          audio BLOB
      )
      ''');
  }

  Future<List<Audio>> getAudios() async {
    Database db = await instance.database;
    var audios = await db.query(
      'audios',
      orderBy: 'name',
      limit: 1,
    );
    List<Audio> groceryList =
        audios.isNotEmpty ? audios.map((c) => Audio.fromMap(c)).toList() : [];
    return groceryList;
  }

  Future<int> addAudios(Audio audio) async {
    Database db = await instance.database;
    return await db.insert('audios', audio.toMap());
  }
}
