enum AppEnvironment {
  dev(
    title: 'DIPL Dev',
    envName: 'dev',
    baseUrl: 'https://randomuser.me/api/',
  ),
  staging(
    title: 'DIPL Staging',
    envName: 'staging',
    baseUrl: 'https://randomuser.me/api/',
  ),
  prod(
    title: 'DIPL',
    envName: 'prod',
    baseUrl: 'https://randomuser.me/api/',
  );

  const AppEnvironment({
    required this.title,
    required this.envName,
    required this.baseUrl,
  });
  final String title;
  final String envName;
  final String baseUrl;

  String get appTitle => title;
  String get environmentName => envName;
  String get connectionString => baseUrl;
}

abstract class EnvInfo {
  static AppEnvironment _environment = AppEnvironment.dev;

  static set environment(AppEnvironment environment) {
    EnvInfo._environment = environment;
  }

  String get appTitle => _environment.title;
  String get environmentName => _environment.envName;
  String get connectionString => _environment.baseUrl;
  static AppEnvironment get environment => _environment;
  static bool get isProduction => _environment == AppEnvironment.prod;
}
