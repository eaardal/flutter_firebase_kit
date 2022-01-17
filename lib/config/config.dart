enum Environment {
  development,
  staging,
  production,
}

class Config {
  static const String appName = "ChopShop";

  String appTitle;
  Environment environment;
  FirebaseConfig firebase;

  Config({
    required this.appTitle,
    required this.environment,
    required this.firebase,
  });

  bool get isDevelopment => environment == Environment.development;
  bool get isStaging => environment == Environment.staging;
  bool get isProduction => environment == Environment.production;
}

class FirebaseConfig {
  bool useEmulator;

  FirebaseConfig({required this.useEmulator});
}
