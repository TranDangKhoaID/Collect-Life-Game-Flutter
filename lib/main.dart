import 'package:collect_life_game/locator.dart';
import 'package:collect_life_game/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  configureDependencies();
  runApp(const MyApp());
}
