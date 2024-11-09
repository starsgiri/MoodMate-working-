// LanguageDurationScreen.dart
import 'package:flutter/material.dart';
import 'MoodConfirmationScreen.dart';

class LanguageDurationScreen extends StatefulWidget {
  final String selectedMoodEmoji;

  const LanguageDurationScreen({super.key, required this.selectedMoodEmoji});

  @override
  // ignore: library_private_types_in_public_api
  _LanguageDurationScreenState createState() => _LanguageDurationScreenState();
}

class _LanguageDurationScreenState extends State<LanguageDurationScreen> {
  String selectedLanguage = 'English';
  int selectedDuration = 15; // Default duration in minutes

  final List<String> languages = ['English', 'Hindi', 'Kannada', 'Tamil', 'Telugu'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Language & Duration"),
        backgroundColor: const Color.fromARGB(255, 77, 48, 156),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Select Language",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Dropdown for language selection
            DropdownButton<String>(
              value: selectedLanguage,
              items: languages.map((language) {
                return DropdownMenuItem(
                  value: language,
                  child: Text(language),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value!;
                });
              },
            ),
            const SizedBox(height: 30),

            const Text(
              "Set Duration (minutes)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Slider for duration selection
            Slider(
              value: selectedDuration.toDouble(),
              min: 5,
              max: 60,
              divisions: 11,
              label: "$selectedDuration min",
              onChanged: (value) {
                setState(() {
                  selectedDuration = value.toInt();
                });
              },
            ),
            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MoodConfirmationScreen(
                      selectedLanguage: selectedLanguage,
                      duration: selectedDuration,
                      moodEmoji: widget.selectedMoodEmoji,
                    ),
                  ),
                );
              },
              child: const Text("Confirm"),
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 130, 54, 54), backgroundColor: const Color.fromARGB(255, 112, 84, 189),
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
