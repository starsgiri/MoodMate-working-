import 'package:flutter/material.dart';

class PlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    final String song = arguments['song'] ?? 'Unknown Song';

    return Scaffold(
      appBar: AppBar(
        title: Text('Now Playing'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade200, Colors.deepPurple.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.music_note,
                size: 100,
                color: Colors.deepPurple.shade300,
              ),
              SizedBox(height: 20),
              Text(
                'Playing: $song',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.stop),
                label: Text('Stop'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
