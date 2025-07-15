abstract interface class DatabaseService {
  /// Базовый метод для инициализации сервиса
  Future<void> init();

  /// Базовый метод для освобождения ресурсов
  Future<void> dispose();

  /// TODO: добавить необходимые методы для работы с базой данных
  // Future<List<TodoTaskModel>> getTasks();
}
