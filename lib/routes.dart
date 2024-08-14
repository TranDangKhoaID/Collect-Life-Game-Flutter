import 'package:collect_life_game/navigation_menu.dart';
import 'package:collect_life_game/screens/home/home_screen.dart';
import 'package:collect_life_game/screens/splash/splash_screen.dart';
import 'package:collect_life_game/screens/trade_cash/trade_cash_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  /// MARK: - Initials;
  static const String splashScreen = '/splash-screen';
  static const String navigationMenu = '/navigation-menu';
  static const String tradeCashScreen = '/trade-cash-screen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
      case navigationMenu:
        return MaterialPageRoute(
          builder: (_) => const NavigationMenu(),
          settings: settings,
        );
      case tradeCashScreen:
        return MaterialPageRoute(
          builder: (_) => const TradeCashScreen(),
          settings: settings,
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Lỗi'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('page_not_found'),
        ),
      );
    });
  }
}
