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

    final List<Map<String, String>> moods = [
      {'name': 'Happy', 'image': 'assets/happy.png'},
      {'name': 'Sad', 'image': 'assets/sad.png'},
      {'name': 'Relaxed', 'image': 'assets/relaxed.png'},
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple.shade300, Colors.deepPurple.shade700],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(height: 20),

                  // Title
                  Text(
                    "How Are You Feeling Today?",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 4.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(1, 2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),

                  // Mood Cards
                  Expanded(
                    child: ListView.builder(
                      itemCount: moods.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to PlaylistPage and pass the mood and playlist
                              Navigator.pushNamed(
                                context,
                                '/playlist',
                                arguments: {
                                  'mood': moods[index]['name'],
                                  'playlist': _getSongsForMood(moods[index]['name']!, userPreferences),
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(16.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 8.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  // Mood Image
                                  Container(
                                    height: 120,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(16.0),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(moods[index]['image']!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),

                                  // Mood Title
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      moods[index]['name']!,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple.shade900,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/journal');
        },
        backgroundColor: Colors.pinkAccent,
        child: Icon(Icons.book, color: Colors.white),
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
