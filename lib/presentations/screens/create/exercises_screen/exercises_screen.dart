import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrls = [
      'https://aponzacbhywcxmzmbwyo.supabase.co/storage/v1/object/public/exercises//biceps.png',
      'https://aponzacbhywcxmzmbwyo.supabase.co/storage/v1/object/public/exercises//jim.png',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Мои упражнения')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 45,
              height: 45,
              child: CachedNetworkImage(
                imageUrl: imageUrls[0],
                fit: BoxFit.cover,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 45,
              height: 45,
              child: CachedNetworkImage(
                imageUrl: imageUrls[1],
                fit: BoxFit.cover,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}