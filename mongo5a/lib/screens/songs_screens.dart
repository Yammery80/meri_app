import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:mongo5a/services/mongo_services.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:mongo5a/models/songs_model.dart';
import 'package:mongo5a/screens/insert_song_screen.dart';


class SongsScreens extends StatefulWidget {
  const SongsScreens({super.key});

  @override
  State<SongsScreens> createState() => _SongsScreensState();
}

class _SongsScreensState extends State<SongsScreens> {
List<SongsModel> songs = [];
  late TextEditingController _nameController;
  late TextEditingController _singerController;
  late TextEditingController _minsController;

@override
  void initState(){
    super.initState();
    _nameController = TextEditingController();
    _singerController = TextEditingController();
    _minsController = TextEditingController();
    _fetchSongs();
  }
  void _fetchSongs() async{
    songs = await MongoServices().getSongs();
    log('en fetch $songs');
    setState(() {});
  }

@override
  void dispose(){
    _nameController.dispose();
    _singerController.dispose();
    _minsController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Canciones'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const InsertSongScreen(),
                  ),
                );
                _fetchSongs();
              },
              child: const Icon(
                Icons.add,
                size: 20.0,
                ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index){
          var song = songs[index];
          return oneTile(song);
        },
      ),
    );
  }

void _deleteSong(mongo.ObjectId id) async{
  await MongoServices().deleteSong(id);
  _fetchSongs();
}

void _updateSong(SongsModel song) async{
  log('Intentando actualizar %{song.toJson()}');
  await MongoServices().updateSong(song);
  _fetchSongs();
}

void _showEditDialog(SongsModel song){
  //Recuperar la información del objeto SongsModel
  _nameController.text = song.name;
  _singerController.text = song.singer;
  _minsController.text = song.mins.toString();
  //Crear un cuadro de dialogo para editar
  showDialog(
    context: context, 
    builder: (context){
      return AlertDialog(
        backgroundColor:  Colors.white, // Cambia el fondo del dialogo
        title: const Text('Editar canción'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
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
              decoration: const InputDecoration(labelText: 'Duración'),
            ),
          ],
        ),
        actions:[
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, // Color del texto de "Cancelar"
              backgroundColor: Colors.red, // Color de fondo de "Cancelar"
            ),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
                song.name = _nameController.text;
                song.singer = _singerController.text;
                song.mins  = int.parse(_minsController.text);
              //Actualizar canciones en Atlas
              _updateSong(song);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, // Color del texto de "Actualizar"
              backgroundColor: Color.fromARGB(255, 4, 93, 93), // Color de fondo de "Actualizar"
            ),
            child: const Text('Actualizar'),
          ),
        ],
      );
    },
  );
}

ListTile oneTile(SongsModel song){
  return ListTile(
    title: Text(song.name, style: Theme.of(context).textTheme.headlineMedium),
    subtitle: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(song.singer, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(width: 10.0),
        Text(' ${song.mins} mins'),
      ],
    ),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.edit, color: Color.fromARGB(255, 4, 93, 93)), 
          onPressed: () => _showEditDialog(song),
        ),
        IconButton(
          icon: const Icon(Icons.delete, color: Color.fromARGB(255, 4, 93, 93)),
          onPressed: () => _deleteSong(song.id),
        ),
      ],
    ),
  );
}
}