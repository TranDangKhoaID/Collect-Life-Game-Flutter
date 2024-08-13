import 'package:collect_life_game/models/item_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class AppPreference {
  /// Save

  //ruby and coin

  /// Logout
  Future<void> logOut() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove(AppPreferenceKey.kItem);
  }
}

class AppPreferenceKey {
  static const String kItem = 'item';
}
