class AppConfigs {
  final String _baseUrl;
  final EnvironmentConfig? env;
  final String apiVersion;

  AppConfigs(this._baseUrl, this.env, this.apiVersion);

  String get baseUrl => '$_baseUrl/$apiVersion';
}

enum EnvironmentConfig { dev, qa, prod }
