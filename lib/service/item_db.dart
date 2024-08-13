import 'package:collect_life_game/models/item_model.dart';
import 'package:collect_life_game/service/database_service.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@lazySingleton
class ItemDB {
  final tableName = 'items';

  Future<void> dropTable() async {
    final database = await DatabaseService().database;
    await database.execute(
      '''
    DROP TABLE IF EXISTS $tableName
      ''',
    );
  }

  Future<void> createTable(Database database) async {
    await database.execute(
      '''
    CREATE TABLE IF NOT EXISTS $tableName (
      "id" TEXT,
      "name" TEXT,
      "type" TEXT,
      "img" TEXT,   
      "rarity" INTEGER,
      "quantity" INTEGER,
      PRIMARY KEY("id")
    );
      ''',
    );
  }

  Future<int> create(ItemModel item) async {
    final database = await DatabaseService().database;

    // Kiểm tra xem id đã tồn tại chưa
    final existing = await database.rawQuery(
      '''
    SELECT id FROM $tableName WHERE id = ?
      ''',
      [item.id],
    );
    if (existing.isNotEmpty) {
      // Nếu id đã tồn tại, tăng quantity thêm 1
      return await database.rawUpdate(
        '''
      UPDATE $tableName 
      SET quantity = quantity + 1
      WHERE id = ?
        ''',
        [item.id],
      );
    } else {
      return await database.rawInsert(
        '''
      INSERT INTO $tableName(id,name,type,img,rarity,quantity) 
      VALUES (?,?,?,?,?,?)
        ''',
        [
          item.id,
          item.name,
          item.type,
          item.img,
          item.rarity,
          item.quantity,
        ],
      );
    }
  }

  Future<List<ItemModel>> fetchAll() async {
    final database = await DatabaseService().database;
    final items = await database.rawQuery(
      '''
        SELECT * FROM $tableName
      ''',
    );
    return items.map((json) => ItemModel.fromJson(json)).toList();
  }

  Future<ItemModel> fetchByID(int id) async {
    final database = await DatabaseService().database;
    final myTag = await database.rawQuery(
      '''
        SELECT * FROM $tableName WHERE id = ?
      ''',
      [id],
    );
    return ItemModel.fromJson(myTag.first);
  }

  Future<void> deleteByID(String id) async {
    final database = await DatabaseService().database;
    await database.rawDelete(
      '''
        DELETE FROM $tableName WHERE id = ?
      ''',
      [id],
    );
  }

  Future<void> deleteAll() async {
    final database = await DatabaseService().database;
    await database.delete(tableName);
  }
}
