import 'package:movie_app/di/dependency_injection.dart' as di;
import 'package:flutter/material.dart';

Future<void> appConfig() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
}
