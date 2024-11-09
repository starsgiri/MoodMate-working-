// MoodSliderScreen.dart
import 'package:flutter/material.dart';

class MoodSliderScreen extends StatefulWidget {
  const MoodSliderScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MoodSliderScreenState createState() => _MoodSliderScreenState();
}

class _MoodSliderScreenState extends State<MoodSliderScreen> {
  final List<String> moodEmojis = ["😄", "😊", "😐", "😢", "😭"];
  int currentMoodIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.music_note, color: Colors.white), // Music icon
            SizedBox(width: 8),
            Text("Mood Music App"),
          ],
        ),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 5,
      ),
      body: Container(
        // Gradient background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title text
            const Text(
              "Set Your Mood 🎶",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),

            // Horizontal emoji list with animated color and size effect
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                moodEmojis.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    moodEmojis[index],
                    style: TextStyle(
                      fontSize: index == currentMoodIndex ? 70 : 50,
                      color: index == currentMoodIndex
                          ? Colors.yellowAccent
                          : Colors.white70,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Slider for mood selection with a custom color theme
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.white30,
                thumbColor: Colors.yellowAccent,
                overlayColor: Colors.yellow.withOpacity(0.3),
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
              ),
              child: Slider(
                value: currentMoodIndex.toDouble(),
                min: 0,
                max: (moodEmojis.length - 1).toDouble(),
                divisions: moodEmojis.length - 1,
                onChanged: (value) {
                  setState(() {
                    currentMoodIndex = value.toInt();
                  });
                },
              ),
            ),

            const SizedBox(height: 30),

            // Play music button
            ElevatedButton.icon(
              onPressed: () {
                // Add functionality to play music based on mood
              },
              icon: const Icon(Icons.play_arrow, size: 28),
              label: const Text("Play Music"),
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 148, 65, 65), backgroundColor: const Color.fromARGB(255, 54, 44, 80),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
