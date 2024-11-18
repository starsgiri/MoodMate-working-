import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mood Mate')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/mood'); // Navigate to the Mood Page
          },
          child: Text('Select Mood'),
        ),
      ),
    );
  }
}
