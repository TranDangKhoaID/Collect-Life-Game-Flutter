import 'package:collect_life_game/common/share_obs.dart';
import 'package:collect_life_game/locator.dart';
import 'package:collect_life_game/routes.dart';
import 'package:collect_life_game/storage/app_preference.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final prefs = locator<AppPreference>();

  @override
  void onReady() {
    super.onReady();
    checkLogged();
  }

  Future<void> checkLogged() async {
    //final isLoggedIn = await prefs.isLoggedIn();
    ShareObs.cash.value = await prefs.getCash();
    Get.offAllNamed(AppRoute.navigationMenu);
  }
}
