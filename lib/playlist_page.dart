import 'package:flutter/material.dart';

class PlaylistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    final String mood = arguments['mood'];
    final List<String> playlist = arguments['playlist'];

    return Scaffold(
      appBar: AppBar(
        title: Text('$mood Playlist'),
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
          itemCount: playlist.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.deepPurple.shade100,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: Icon(Icons.music_note, color: Colors.deepPurple.shade800),
                title: Text(
                  playlist[index],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.