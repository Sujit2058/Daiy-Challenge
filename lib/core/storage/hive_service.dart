import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const settingsBox = 'settingsBox';

  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(settingsBox);
  }

  Box get settings => Hive.box(settingsBox);
}