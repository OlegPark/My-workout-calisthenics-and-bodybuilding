abstract interface class NotificationsService {
  /// Базовый метод для инициализации сервиса
  Future<void> init();

  /// Стрим для получения сообщений
  Stream<String> get onMessage;
}
