

import '../common/utils/enum_util.dart';

enum Flavor { dev, stg, production }

class FlavorValues {
  final String baseUrlApiTask;
  final String baseUrlApiMovie;
  final String baseUrlApiSearchMovie;

  FlavorValues({
    required this.baseUrlApiTask,
    required this.baseUrlApiMovie,
    required this.baseUrlApiSearchMovie,
  });
}

abstract class FlavorConfig {
  static Flavor? _flavor;
  static String? _flavorName;
  static FlavorValues? _values;

  static void set(Flavor flavor, FlavorValues values) {
    _flavor = flavor;
    _flavorName = enumToString(flavor);
    _values = values;
  }

  static bool isDev() => _flavor! == Flavor.dev;

  static bool isStg() => _flavor! == Flavor.stg;

  static bool isProduction() => _flavor! == Flavor.production;

  static FlavorValues get values => _values!;
}
