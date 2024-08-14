import 'package:collect_life_game/common/share_obs.dart';
import 'package:collect_life_game/locator.dart';
import 'package:collect_life_game/service/item_db.dart';
import 'package:collect_life_game/storage/app_preference.dart';
import 'package:get/get.dart';

class TradeCashController extends GetxController {
  final _itemDB = locator<ItemDB>();
  final _prefs = locator<AppPreference>();

  Future<void> trade1(int quantity) async {
    try {
      await _itemDB.updateQuantity('coin_gold_id', quantity);
    } catch (e) {
      print('Error pick money $e');
    }
  }
}
