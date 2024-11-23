import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  final TextEditingController _controller = TextEditingController();
  List<String> entries = [];

  @override
  void initState() {
    super.initState();
    _fetchEntries();
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'journal.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE journal(id INTEGER PRIMARY KEY, content TEXT)',
        );
      },
    );
  }

  Future<void> _saveEntry(String content) async {
    final db = await _initDatabase();
    await db.insert('journal', {'content': content});
    _fetchEntries();
  }

  Future<void> _fetchEntries() async {
    final db = await _initDatabase();
    final data = await db.query('journal');
    setState(() {
      entries = data.map((e) => e['content'] as String).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Journal')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: entries.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(entries[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Write your feelings...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                _saveEntry(_controller.text);
                _controller.clear();
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
