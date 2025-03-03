import 'package:flutter/material.dart';
import 'package:mongo5a/models/group_model.dart';
import 'package:mongo5a/services/mongo_services.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class InsertGroupScreen extends StatefulWidget {
  const InsertGroupScreen({super.key});

  @override
  State<InsertGroupScreen> createState() => _InsertGroupScreenState();
}

class _InsertGroupScreenState extends State<InsertGroupScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _albumsController;

@override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _albumsController = TextEditingController();
  }

@override
void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _albumsController.dispose();
    super.dispose();
  }

 Future<void> _insertGroup() async{
    var group = GroupModel(
      id: mongo.ObjectId(),
      name: _nameController.text,
      type: _descriptionController.text,
      albums: int.parse(_albumsController.text), 
      );
      await MongoServices().insertGroup(group);
      if (!mounted) return;
      Navigator.of(context).pop();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grupos mùsicales del rock'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText:'Nombre'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Tipo'),
            ),
            TextField(
              controller: _albumsController,
              decoration: const InputDecoration(labelText: 'Albums'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _insertGroup,
              child: const Text('Insertar grupo'),
            ),
        ],)
      ),
    );
  }
}


