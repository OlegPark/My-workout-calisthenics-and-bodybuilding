abstract interface class StorageService {
  /// Базовый метод для инициализации сервиса
  Future<void> init();

  /// Базовый метод для освобождения ресурсов
  Future<void> dispose();

  /// Получить URL изображения по имени файла
  Future<String?> getImageUrl(String fileName);

  /// Получить публичный URL для изображения
  String getPublicImageUrl(String fileName);
} 