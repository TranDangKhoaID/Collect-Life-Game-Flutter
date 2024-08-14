import 'package:collect_life_game/common/share_obs.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class AppPreference {
  /// Save

  //ruby and coin
  Future<void> saveCash({
    required double cash,
  }) async {
    final pref = await SharedPreferences.getInstance();
    pref.setDouble(AppPreferenceKey.kCash, cash);
  }

  Future<double> getCash() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getDouble(AppPreferenceKey.kCash) ?? 0;
  }

  //timer energy
  Future<void> saveLastExitTime() async {
    final prefs = await SharedPreferences.getInstance();
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    await prefs.setInt(AppPreferenceKey.klastExitTime, currentTime);
  }

  Future<void> restoreEnergy() async {
    final prefs = await SharedPreferences.getInstance();
    final lastExitTime = prefs.getInt(AppPreferenceKey.klastExitTime) ?? 0;
    final currentTime = DateTime.now().millisecondsSinceEpoch;

    // Tính số phút đã qua
    final minutesPassed = (currentTime - lastExitTime) ~/ (1000 * 60);

    // Tăng năng lượng dựa trên số phút đã qua
    ShareObs.energy.value += minutesPassed;

    // Đảm bảo năng lượng không vượt quá giá trị tối đa nếu có
    if (ShareObs.energy.value >= 100) {
      ShareObs.energy.value = 100;
    }
  }

  /// Logout
  Future<void> logOut() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove(AppPreferenceKey.kCash);
  }
}

class AppPreferenceKey {
  static const String kCash = 'cash';
  static const String klastExitTime = 'last_exit_time';
}
