import 'package:flutter/material.dart';

class MediaProfileCard extends StatefulWidget {
  const MediaProfileCard({Key? key}) : super(key: key);

  @override
  State<MediaProfileCard> createState() => _MediaProfileCardState();
}

class _MediaProfileCardState extends State<MediaProfileCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Local asset image display
            // NOTE: Ensure you add your image file (e.g., assets/profile.png)
            // to your pubspec.yaml file under the assets section!
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                'assets/profile.png', // Replace with your own image path
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 120,
                    height: 120,
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image, size: 40),
                  );
                },
              ),
            ),
            const SizedBox(height: 12.0),
            const Text(
              'User Profile Card',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            // Interactive Icon widget
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
                size: 28.0,
              ),
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(child: MediaProfileCard()),
      ),
    ),
  );
}