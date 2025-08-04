import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_workout_cab/features/create/domain/entities/model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Получить все упражнения из Firestore
  Future<List<Exercise>> getExercises() async {
    try {
      final QuerySnapshot snapshot = await _firestore
          .collection('exercises')
          .get();

      final List<Exercise> exercises = [];
      
      for (var doc in snapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        
        final exercise = Exercise(
          id: data['id'] ?? '',
          name: data['name'] ?? '',
          imageUrl: data['imageUrl'] ?? '',
          muscleGroups: List<String>.from(data['muscleGroups'] ?? []),
        );
        
        exercises.add(exercise);
      }
      
      return exercises;
    } catch (e) {
      return [];
    }
  }
} 