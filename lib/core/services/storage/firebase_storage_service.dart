import 'package:firebase_storage/firebase_storage.dart';
import 'package:my_workout_cab/core/services/storage/storage_service.dart';

class FirebaseStorageService implements StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  Future<void> init() async {
    // Firebase уже инициализирован в main.dart
  }

  @override
  Future<void> dispose() async {
    // Firebase автоматически управляет ресурсами
  }

  @override
  Future<String?> getImageUrl(String fileName) async {
    try {
      final Reference ref = _storage.ref(fileName);
      return await ref.getDownloadURL();
    } catch (e) {
      return null;
    }
  }

  @override
  String getPublicImageUrl(String fileName) {
    final encodedFileName = Uri.encodeComponent(fileName);
    return 'https://firebasestorage.googleapis.com/v0/b/my-wcab.firebasestorage.app/o/$encodedFileName?alt=media';
  }

  // Получить URL изображения для упражнения
  Future<String?> getExerciseImageUrl(String imageUrl) async {
    try {
      // Если imageUrl уже полный URL, возвращаем его
      if (imageUrl.startsWith('http')) {
        return imageUrl;
      }
      
      // Иначе получаем URL из Firebase Storage
      return await getImageUrl(imageUrl);
    } catch (e) {
      return null;
    }
  }

  // Получить URL изображения с приоритетом на прямые URL
  String getDirectImageUrl(String fileName) {
    return getPublicImageUrl(fileName);
  }
} 