import 'package:flutter/material.dart';
import 'package:mongo5a/models/songs_model.dart';
import 'package:mongo5a/services/mongo_services.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class InsertSongScreen extends StatefulWidget {
  const InsertSongScreen({super.key});

  @override
  State<InsertSongScreen> createState() => _InsertSongScreenState();
}
class _InsertSongScreenState extends State<InsertSongScreen> {
  late TextEditingController _nameController;
  late TextEditingController _singerController;
  late TextEditingController _minsController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _singerController = TextEditingController();
    _minsController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _singerController.dispose();
    _minsController.dispose();
    super.dispose();
  }

  Future<void> _insertSong() async {
    var song = SongsModel(
      id: mongo.ObjectId(),
      name: _nameController.text,
      singer: _singerController.text,
      mins: int.parse(_minsController.text),
    );
    await MongoServices().insertSong(song);
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Canciones'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: _singerController,
              decoration: const InputDecoration(labelText: 'Cantante'),
            ),
            TextField(
              controller: _minsController,
              decoration: const InputDecoration(labelText: 'Duración en minutos'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _insertSong,
              child: const Text('Insertar canción'),
            ),
          ],
        ),
      ),
    );
  }
}