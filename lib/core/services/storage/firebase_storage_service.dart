import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Получить URL изображения по имени файла
  Future<String?> getImageUrl(String fileName) async {
    try {
      final Reference ref = _storage.ref(fileName);
      return await ref.getDownloadURL();
    } catch (e) {
      return null;
    }
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

  // Создать публичный URL для изображения
  String getPublicImageUrl(String fileName) {
    final encodedFileName = Uri.encodeComponent(fileName);
    return 'https://firebasestorage.googleapis.com/v0/b/my-wcab.firebasestorage.app/o/$encodedFileName?alt=media';
  }

  // Получить URL изображения с приоритетом на прямые URL
  String getDirectImageUrl(String fileName) {
    return getPublicImageUrl(fileName);
  }
} 