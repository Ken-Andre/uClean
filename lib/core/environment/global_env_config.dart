import 'base_env_config.dart';

/// Global environment-specific configurations.
///
/// Extends [BaseEnvConfig] and provides the environment values specific
/// to the Global environment.
class GlobalEnvConfig extends BaseEnvConfig {
  @override
  String get userId => '2';
}
