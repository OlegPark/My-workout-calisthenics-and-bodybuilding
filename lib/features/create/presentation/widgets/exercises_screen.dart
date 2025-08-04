import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_workout_cab/core/services/database/database_service.dart';
import 'package:my_workout_cab/core/services/database/firestore_service.dart';
import 'package:my_workout_cab/core/services/storage/storage_service.dart';
import 'package:my_workout_cab/core/services/storage/firebase_storage_service.dart';
import 'package:my_workout_cab/features/create/domain/entities/model.dart';
import 'package:my_workout_cab/core/theme/theme_extension.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  final DatabaseService _databaseService = FirestoreService();
  final StorageService _storageService = FirebaseStorageService();
  List<Exercise> exercises = [];
  List<Exercise> filteredExercises = []; // Отфильтрованные упражнения
  Set<String> selectedExercises = {}; // Для отслеживания выбранных упражнений
  bool isLoading = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadExercises();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterExercises(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredExercises = exercises;
      } else {
        filteredExercises = exercises.where((exercise) {
          return exercise.name.toLowerCase().contains(query.toLowerCase()) ||
                 exercise.muscleGroups.any((group) => 
                   group.toLowerCase().contains(query.toLowerCase()));
        }).toList();
      }
    });
  }

  Future<void> _loadExercises() async {
    try {
      // Получаем упражнения из Firestore
      final List<Exercise> firestoreExercises = await _databaseService.getExercises();
      
      // Для каждого упражнения получаем правильный URL изображения
      final List<Exercise> exercisesWithImages = [];
      
      for (Exercise exercise in firestoreExercises) {
        // Используем прямые URL для изображений
        final String imageUrl = _storageService.getPublicImageUrl(exercise.imageUrl);
        
        exercisesWithImages.add(Exercise(
          id: exercise.id,
          name: exercise.name,
          imageUrl: imageUrl,
          muscleGroups: exercise.muscleGroups,
        ));
      }
      
      setState(() {
        exercises = exercisesWithImages;
        filteredExercises = exercisesWithImages; // Инициализируем отфильтрованные упражнения
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeExtension>();
    
    return Scaffold(
      backgroundColor: customTheme?.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Мои упражнения',
          style: TextStyle(
            color: customTheme?.gnavColor,
            fontFamily: customTheme?.customTextStyle?.fontFamily,
          ),
        ),
        backgroundColor: customTheme?.backgroundColor,
        elevation: 0,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: customTheme?.gnavColor,
              ),
            )
          : exercises.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.fitness_center,
                        size: 64,
                        color: customTheme?.gnavColor?.withValues(alpha: 0.4),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Упражнения не найдены',
                        style: TextStyle(
                          fontSize: 18,
                          color: customTheme?.gnavColor,
                          fontFamily: customTheme?.customTextStyle?.fontFamily,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Добавьте упражнения в Firestore',
                        style: TextStyle(
                          fontSize: 14,
                          color: customTheme?.gnavColor?.withValues(alpha: 0.6),
                          fontFamily: customTheme?.customTextStyle?.fontFamily,
                        ),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    // Поле поиска
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: _searchController,
                        onChanged: _filterExercises,
                        style: TextStyle(
                          color: customTheme?.gnavColor,
                          fontFamily: customTheme?.customTextStyle?.fontFamily,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Поиск упражнений...',
                          hintStyle: TextStyle(
                            color: customTheme?.gnavColor?.withValues(alpha: 0.6),
                            fontFamily: customTheme?.customTextStyle?.fontFamily,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: customTheme?.gnavColor,
                          ),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color: customTheme?.gnavColor,
                                  ),
                                  onPressed: () {
                                    _searchController.clear();
                                    _filterExercises('');
                                  },
                                )
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: customTheme?.gnavColor ?? Colors.grey,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: customTheme?.gnavColor?.withValues(alpha: 0.3) ?? Colors.grey,
                            ),
                          ),
                          filled: true,
                          fillColor: customTheme?.cardColor,
                        ),
                      ),
                    ),
                    // Список упражнений
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ListView.builder(
                          itemCount: filteredExercises.length,
                          itemBuilder: (context, index) {
                            final exercise = filteredExercises[index];
                            return Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              elevation: 4,
                              color: customTheme?.cardColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    // Изображение упражнения
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: SizedBox(
                                        width: 60,
                                        height: 60,
                                        child: CachedNetworkImage(
                                          imageUrl: exercise.imageUrl,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) => Container(
                                            color: customTheme?.gnavColor?.withValues(alpha: 0.1),
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                color: customTheme?.gnavColor,
                                              ),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) => Container(
                                            color: customTheme?.gnavColor?.withValues(alpha: 0.1),
                                            child: Icon(
                                              Icons.fitness_center,
                                              color: customTheme?.gnavColor?.withValues(alpha: 0.5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    // Информация об упражнении
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            exercise.name,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: customTheme?.gnavColor,
                                              fontFamily: customTheme?.customTextStyle?.fontFamily,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            exercise.muscleGroups.join(', '),
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: customTheme?.gnavColor?.withValues(alpha: 0.7),
                                              fontFamily: customTheme?.customTextStyle?.fontFamily,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Чекбокс
                                    Checkbox(
                                      value: selectedExercises.contains(exercise.id),
                                      activeColor: customTheme?.gnavColor,
                                      checkColor: customTheme?.cardColor,
                                      onChanged: (value) {
                                        if (value == true) {
                                          setState(() {
                                            selectedExercises.add(exercise.id);
                                          });
                                        } else {
                                          setState(() {
                                            selectedExercises.remove(exercise.id);
                                          });
                                        }
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('Выбрано упражнение: ${exercise.name}'),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}