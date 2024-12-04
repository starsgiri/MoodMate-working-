import 'package:flutter/material.dart';
import 'login_page.dart';
import 'personalization_page.dart';
import 'mood_page.dart';  // Import the MoodPage
import 'playlist_page.dart';  // Import the PlaylistPage


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoodMate',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: LoginPage(),  // Start with the LoginPage
      routes: {
        '/personalization': (context) => PersonalizationPage(),
        '/mood': (context) => MoodPage(),  // Add route for MoodPage
        '/playlist': (context) => PlaylistPage(),  // Add route for PlaylistPage
            // Route to JournalPage (if exists)
      },
    );
  }
}
