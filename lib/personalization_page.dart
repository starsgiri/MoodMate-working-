import 'package:flutter/material.dart';

class PersonalizationPage extends StatefulWidget {
  @override
  _PersonalizationPageState createState() => _PersonalizationPageState();
}

class _PersonalizationPageState extends State<PersonalizationPage> {
  String? selectedLanguage;
  String? selectedGenre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personalize Your Experience'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Your Preferred Language:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedLanguage,
              isExpanded: true,
              hint: Text('Choose a language'),
              items: ['English', 'Korean', 'Hindi'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedLanguage = newValue;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Select Your Favorite Genre:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedGenre,
              isExpanded: true,
              hint: Text('Choose a genre'),
              items: ['Pop', 'R&B', 'Acoustic'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedGenre = newValue;
                });
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                if (selectedLanguage != null && selectedGenre != null) {
                  Navigator.pushNamed(
                    context,
                    '/mood',
                    arguments: {
                      'language': selectedLanguage,
                      'genre': selectedGenre,
                    },
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select all options')),
                  );
                }
              },
              child: Text('Next'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
