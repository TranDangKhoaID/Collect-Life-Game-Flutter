import 'package:collect_life_game/common/share_obs.dart';
import 'package:collect_life_game/locator.dart';
import 'package:collect_life_game/models/item_model.dart';
import 'package:collect_life_game/service/database_service.dart';
import 'package:collect_life_game/storage/app_preference.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@lazySingleton
class ItemDB {
  final tableName = 'items';
  final _prefs = locator<AppPreference>();

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
      "number" INTEGER,   
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
      INSERT INTO $tableName(id,name,type,img,number,quantity) 
      VALUES (?,?,?,?,?,?)
        ''',
        [
          item.id,
          item.name,
          item.type,
          item.img,
          item.number,
          item.quantity,
        ],
      );
    }
  }

  Future<void> updateQuantity(String id, int quantityToSubtract) async {
    final database = await DatabaseService().database;

    // Kiểm tra xem id đã tồn tại chưa
    final existing = await database.rawQuery(
      '''
    SELECT id, quantity FROM $tableName WHERE id = ?
      ''',
      [id],
    );

    if (existing.isNotEmpty) {
      // Lấy quantity hiện tại
      final currentQuantity = existing.first['quantity'] as int;
      if (currentQuantity <= 0 || currentQuantity < quantityToSubtract) {
        print('Số lượng = 0 hoặc bé hơn số lượng cần đổi');
        return;
      }
      // Tính quantity mới
      final newQuantity = currentQuantity - quantityToSubtract;
      await database.rawUpdate(
        '''
        UPDATE $tableName 
        SET quantity = ?
        WHERE id = ?
        ''',
        [newQuantity, id],
      );
      ShareObs.cash.value += 1000000;
      _prefs.saveCash(cash: ShareObs.cash.value);
      print('Thành công');
    } else {
      print('id không tồn tại');
      return;
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
