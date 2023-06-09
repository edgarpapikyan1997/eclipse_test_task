import '../constants/flavor.dart';
import '../data/models/config.dart';
import '../environments/development/development.dart';
import '../environments/production/production.dart';
import '../environments/staging/staging.dart';
import '../environments/test/test.dart';

class FlavorService {
  late final Flavor flavor;
  late final Config config;

  FlavorService({required this.flavor}) {
    switch (flavor) {
      case Flavor.DEV:
        config = Config.fromMap(developmentEnv);
        break;
      case Flavor.PROD:
        config = Config.fromMap(productionEnv);
        break;
      case Flavor.TEST:
        config = Config.fromMap(testEnv);
        break;
      case Flavor.STAGING:
        config = Config.fromMap(stagingEnv);
        break;
    }
  }

  bool get isDevelopment => flavor == Flavor.DEV;

  bool get isProduction => flavor == Flavor.PROD;
}
