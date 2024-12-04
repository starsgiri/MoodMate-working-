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
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/avtar.png.png'), // Ensure this image exists in your assets folder
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), // Slightly darken the image for better readability
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Back Button
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context); // Navigate back
                        },
                      ),
                    ),
                    SizedBox(height: 40),

                    // Profile Picture
                    GestureDetector(
                      onTap: () {
                        // Implement image picker logic
                      },
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/avtar.png.png'), // Replace with actual profile image if available
                        backgroundColor: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    SizedBox(height: 30),

                    // Language Selection
                    Text(
                      'Select Your Preferred Language:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: DropdownButton<String>(
                        value: selectedLanguage,
                        isExpanded: true,
                        hint: Text(
                          'Choose a language',
                          style: TextStyle(color: Colors.black),
                        ),
                        underline: SizedBox(),
                        items: ['English', 'Korean', 'Hindi'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              children: [
                                Icon(Icons.language, color: Colors.blueAccent),
                                SizedBox(width: 8),
                                Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedLanguage = newValue;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20),

                    // Genre Selection
                    Text(
                      'Select Your Favorite Genre:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: DropdownButton<String>(
                        value: selectedGenre,
                        isExpanded: true,
                        hint: Text(
                          'Choose a genre',
                          style: TextStyle(color: Colors.black),
                        ),
                        underline: SizedBox(),
                        items: ['Pop', 'R&B', 'Acoustic'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              children: [
                                Icon(Icons.music_note, color: Colors.pinkAccent),
                                SizedBox(width: 8),
                                Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedGenre = newValue;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 30),

                    // Next Button
                    ElevatedButton(
                      onPressed: () {
                        if (selectedLanguage != null && selectedGenre != null) {
                          // Navigate to MoodPage with selected values as arguments
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
                      child: Text(
                        'Next',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.pinkAccent,
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
