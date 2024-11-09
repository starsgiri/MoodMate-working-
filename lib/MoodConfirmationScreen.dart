// MoodConfirmationScreen.dart
import 'package:flutter/material.dart';

class MoodConfirmationScreen extends StatelessWidget {
  final String selectedLanguage;
  final int duration;
  final String moodEmoji;

  const MoodConfirmationScreen({
    super.key,
    required this.selectedLanguage,
    required this.duration,
    required this.moodEmoji,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mood Confirmation"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Mood Set! 🎶",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                "Mood: $moodEmoji",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                "Language: $selectedLanguage",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                "Duration: $duration minutes",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 40),
              const Text(
                "Songs will play shortly...",
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
