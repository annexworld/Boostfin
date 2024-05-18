class AppConfigs {
  final String? baseUrl;
  final EnvironmentConfig? env;

  AppConfigs(this.baseUrl, this.env);
}

enum EnvironmentConfig { dev, qa, prod }
