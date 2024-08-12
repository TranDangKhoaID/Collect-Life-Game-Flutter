import 'package:collect_life_game/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateRoute: AppRoute.generateRoute,
      navigatorKey: Get.key,
      initialRoute: AppRoute.navigationMenu,
    );
    ;
  }
}
