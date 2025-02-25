import 'dart:io';
import 'package:mongo5a/models/group_model.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'dart:developer';

class MongoServices{
  //Único Punto de Accceso
  static final MongoServices _instance = MongoServices._internal();

  //La base de datos a conectar
  late mongo.Db _db;

  MongoServices._internal();

  factory MongoServices(){
    return _instance;
  }

//Usando el método connect() de la clase Db, se establece la conexión con la base de datos.
  Future<void> connect() async{
        try {
      _db = await mongo.Db.create(
          'mongodb+srv://meribethperez27:Htacw8NUmYQLuOyt@cluster0.1pxhk.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0');
      await _db.open();
      _db.databaseName = 'music';
      log('Conexion exitosa a MongoDB');
    } on SocketException catch (e) {
      log('Error de conexion: $e');
      rethrow;
    }

  }

  mongo.Db get db {
    if(!_db.isConnected){
      throw StateError(
        'Base de datos no incializada, llama a connect() primero');
    }
    return _db;
  }

  Future<List<GroupModel>> getGroups() async {
    final collection =db.collection('groups');
    log('Collecion obtenida; $collection');
    var groups = await collection.find().toList();
    log('En MongoServices $groups');
    if (groups.isEmpty) {
    log('No se encontraron grupos en la colexion');
    }
    return groups.map((grupo) => GroupModel.fromJson(grupo)).toList();
  }

  Future<void> deleteGroup(mongo.ObjectId id) async {
    final collection = db.collection('groups');
    await collection.remove(mongo.where.eq('_id', id));
  }

  Future<void> updateGroup(GroupModel group) async {
    final collection = _db.collection('groups');
    await collection.updateOne(
      mongo.where.eq('_id', group.id),
      mongo.modify.set('name', group.name).set('type', group.type).set('albums', group.albums),
    );
  }

}