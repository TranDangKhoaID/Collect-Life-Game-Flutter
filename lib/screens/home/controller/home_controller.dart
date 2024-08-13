import 'dart:math';

import 'package:collect_life_game/locator.dart';
import 'package:collect_life_game/models/item_model.dart';
import 'package:collect_life_game/service/database_service.dart';
import 'package:collect_life_game/service/item_db.dart';
import 'package:collect_life_game/storage/app_preference.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //final _appPref = locator<AppPreference>();
  final _itemDB = locator<ItemDB>();

  Future<void> pickItemLocal() async {
    try {
      await _itemDB.create(getCoin());
      print('Thành công');
    } catch (e) {
      print('Error pick money $e');
    }
  }

  Future<void> deleteAllCoin() async {
    try {
      _itemDB.deleteAll();
    } catch (e) {
      print('Error $e');
    }
  }

  Future<void> dropAndCreateDB() async {
    try {
      final database = await DatabaseService().database;
      await _itemDB.dropTable();
      await _itemDB.createTable(database);
    } catch (e) {
      print('Error $e');
    }
  }

  ItemModel getCoin() {
    String coin_id = 'item_id';
    final number = getRandomNumberRarity();
    final item = ItemModel(
      id: coin_id,
      type: 'coin',
      number: number,
      quantity: 1,
    );

    updateItemDetails(item, number);
    return item;
  }

  void updateItemDetails(ItemModel item, int number) {
    String url0 = dotenv.env['BASE_URL_0']!;
    String url1 = dotenv.env['BASE_URL_1']!;
    switch (number) {
      case 0:
        item.id = 'coin_gold_id';
        item.img = url0;
        item.name = 'Gold Coin';
        break;
      case 1:
        item.id = 'coin_red_id';
        item.img = url1;
        item.name = 'Red Coin';
        break;
      default:
        // Xử lý trường hợp mặc định nếu cần
        break;
    }
  }

  int getRandomNumberRarity() {
    // Tỷ lệ độ hiếm
    List<int> rarityWeights = [50, 40, 10];
    int totalWeight = rarityWeights.reduce((a, b) => a + b);
    Random random = Random();
    int randomNumber = random.nextInt(totalWeight);
    int cumulativeWeight = 0;

    for (int i = 0; i < rarityWeights.length; i++) {
      cumulativeWeight += rarityWeights[i];
      if (randomNumber < cumulativeWeight) {
        return i;
      }
    }
    // Trong trường hợp không khớp (không xảy ra trong thực tế)
    return 0;
  }
}
