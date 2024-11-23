import 'package:flutter/material.dart';

class MoodPage extends StatelessWidget {
  final List<Map<String, String>> songDatabase = [
    {'title': 'Start Over - Gaho', 'mood': 'Happy', 'language': 'English', 'genre': 'Pop'},
    {'title': 'Beautiful - Crush', 'mood': 'Happy', 'language': 'Korean', 'genre': 'Pop'},
    {'title': 'Let Her Go - Passenger', 'mood': 'Sad', 'language': 'English', 'genre': 'Acoustic'},
    {'title': 'Drunk - Keshi', 'mood': 'Relaxed', 'language': 'English', 'genre': 'R&B'},
    // Add more songs here
  ];

  @override
  Widget build(BuildContext context) {
    final userPreferences = ModalRoute.of(context)?.settings.arguments as Map;

    final List<String> moods = ['Happy', 'Sad', 'Relaxed'];

    return Scaffold(
      appBar: AppBar(
        title: Text('How Are You Feeling Today?'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade200, Colors.deepPurple.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: moods.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.deepPurple.shade100,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text(
                  moods[index],
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple.shade800,
                  ),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/song_suggestions',
                    arguments: {
                      'mood': moods[index],
                      'playlist': _getSongsForMood(moods[index], userPreferences),
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/journal');
        },
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
      ),
    );
  }

  List<String> _getSongsForMood(String mood, Map userPreferences) {
    return songDatabase
        .where((song) =>
    song['mood'] == mood &&
        song['language'] == userPreferences['language'] &&
        song['genre'] == userPreferences['genre'])
        .map((song) => song['title']!)
        .toList();
  }
}
