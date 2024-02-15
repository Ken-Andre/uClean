import 'base_env_config.dart';
import 'micmarketapi_env_config.dart';
import 'ucleanapi_env_config.dart';

enum Environment { micMarketAPI, uCleanAPI }

class EnvConfig {
  late BaseEnvConfig config;

  initConfig({Environment? environment}) {
    config = _getConfig(environment ?? null);
  }

  _getConfig([Environment? environment]) {
    switch (environment) {
      case Environment.micMarketAPI:
        return MicmarketApiEnvConfig();
      case Environment.uCleanAPI:
        return UcleanApiEnvConfig();
      default:
        return MicMarketAPIEnvConfig();
    }
  }
}
