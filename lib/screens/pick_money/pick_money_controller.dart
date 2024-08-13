import 'package:collect_life_game/locator.dart';
import 'package:collect_life_game/models/item_model.dart';
import 'package:collect_life_game/service/item_db.dart';
import 'package:collect_life_game/storage/app_preference.dart';
import 'package:get/get.dart';

class PickMoneyController extends GetxController {
  //final _appPref = locator<AppPreference>();
  final _itemDB = locator<ItemDB>();

  Future<void> pickMoneyLocal() async {
    try {
      final item = ItemModel(
        id: 'coin_id',
        img: 'https://pngimg.com/uploads/coin/coin_PNG36907.png',
        name: 'Coin',
        type: 'coin',
        rarity: 0,
        quantity: 1,
      );
      await _itemDB.create(item);
      print('Thành công');
    } catch (e) {
      print('Error pick money $e');
    }
  }
}
