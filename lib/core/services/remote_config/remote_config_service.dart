abstract interface class RemoteConfigService {
  /// Базовый метод для инициализации сервиса
  Future<void> init();

  /// Получение конфигурации по ключу в виде Map
  Map<String, dynamic> getConfig(String key);

  /// Получение конфигурации по ключу в виде строки
  String getString(String key);
}
