import 'package:flutter/material.dart';
import 'app.dart';
import 'config/app_config.dart';
import 'config/flavor_config.dart';
import 'config/network_constants.dart';

void main() async {
  FlavorConfig.set(
      Flavor.production,
      FlavorValues(
          baseUrlApiTask: baseUrlProd,
          baseUrlApiMovie: baseUrlMovieDev,
          baseUrlApiSearchMovie: ''));
  await appConfig();
  runApp(const App());
}
