import 'package:flutter/material.dart';

class PlaylistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    final String mood = arguments['mood'] ?? 'Mood';
    final List<String> playlist = arguments['playlist'] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('$mood Playlist'),
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
        child: ListView.builder(
          itemCount: playlist.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.deepPurple.shade100,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.deepPurple.shade300,
                  child: Icon(Icons.music_note, color: Colors.white),
                ),
                title: Text(
                  playlist[index],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurple.shade800,
                  ),
                ),
                trailing: Icon(
                  Icons.play_arrow,
                  color: Colors.deepPurple.shade700,
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/player',
                    arguments: {
                      'song': playlist[index],
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
