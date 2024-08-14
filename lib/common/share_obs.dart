import 'package:get/get.dart';

class ShareObs {
  static final RxDouble cash = 0.0.obs;
  static final RxInt energy = 10.obs;

  /// Logout
  static void logout() async {
    ShareObs.cash.value = 0;
  }
}
