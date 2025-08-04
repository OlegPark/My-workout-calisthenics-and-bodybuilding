import 'package:my_workout_cab/features/create/domain/entities/model.dart';

abstract interface class DatabaseService {
  /// Базовый метод для инициализации сервиса
  Future<void> init();

  /// Базовый метод для освобождения ресурсов
  Future<void> dispose();

  /// Получить все упражнения
  Future<List<Exercise>> getExercises();
}
