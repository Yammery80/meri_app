import 'package:flutter/material.dart';
import 'package:mongo5a/models/group_model.dart';
import 'package:mongo5a/services/mongo_services.dart';
import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:mongo5a/screens/insert_group_screen.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({super.key});

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  List<GroupModel> groups = [];
  late TextEditingController _nameController;
  late TextEditingController _typeController;
  late TextEditingController _albumsController;

@override
  void initState(){
    super.initState();
    _nameController = TextEditingController();
    _typeController = TextEditingController();
    _albumsController = TextEditingController();
    _fetchGroups();
  }

  void _fetchGroups() async{
    groups = await MongoServices().getGroups();
    log('en fetch $groups');
    setState(() {});
  }

@override
  void dispose(){
    _nameController.dispose();
    _typeController.dispose();
    _albumsController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar: AppBar(
      title: const Text('Grupos'),
      actions: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const InsertGroupScreen(),
                ),
              );
              _fetchGroups();
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
        itemCount: groups.length,
        itemBuilder: (context, index) {
          var group = groups[index];
          return oneTile(group);
        },
      ),
   );
  }

  void _deleteGroup(mongo.ObjectId id) async{
    await MongoServices().deleteGroup(id);
    _fetchGroups();
  }

  void _updateGroup(GroupModel group) async{
    log('Intentando actualizar: %{group.toJson()}');
    await MongoServices().updateGroup(group);
    _fetchGroups();
  }

void _showEditDialog(GroupModel group){
  //Recuperar la información del objeto GroupModel
  _nameController.text = group.name;
  _typeController.text = group.type;
  _albumsController.text = group.albums.toString();
  //Crear un cuadro de dialogo para editar
  showDialog(
    context: context, 
    builder: (context) {
      return AlertDialog(
        backgroundColor:  Colors.white, // Cambia el fondo del dialogo
        title: const Text('Editar Grupo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children:[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller : _typeController,
              decoration: const InputDecoration(labelText: 'Tipo'),
            ),
            TextField(
              controller: _albumsController,
              decoration: const InputDecoration(labelText: 'Albums'),
            ),
          ],
        ),
        actions: [
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
              group.name = _nameController.text;
              group.type = _typeController.text;
              group.albums = int.parse(_albumsController.text);
              //Actualizar el grupo en Atlas
              _updateGroup(group);
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

  ListTile oneTile(GroupModel group){
    return ListTile(
    title: Text(group.name,
    style: Theme.of(context).textTheme.headlineMedium), //Texto
    subtitle: Row(
      children: [
        Text(group.type, style: TextStyle(fontWeight: FontWeight.bold),), //Tipo
        const SizedBox(width: 10.0),
        Text(' ${group.albums.toString()} albums'), //Albums
      ],
    ),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children:[
        IconButton(
          onPressed: () => _showEditDialog(group),
          icon: const Icon(Icons.edit, color: Color.fromARGB(255, 4, 93, 93),)), //Icono de editar
        IconButton(
          onPressed: () => _deleteGroup(group.id),
          icon: const Icon(Icons.delete, color: Color.fromARGB(255, 4, 93, 93),)), //Icono de eliminar
         ],
       ),
    );
  }
}