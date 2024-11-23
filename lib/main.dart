import 'package:flutter/material.dart';
import 'package:moodmate/journal_page.dart';
import 'personalization_page.dart';
import 'mood_page.dart';
import 'song_suggestions_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoodMate',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/personalization',
      routes: {
        '/personalization': (context) => PersonalizationPage(),
        '/mood': (context) => MoodPage(),
        '/song_suggestions': (context) => SongSuggestionPage(),
        '/journal': (context) => const JournalPage(),
      },
    );
  }
}
