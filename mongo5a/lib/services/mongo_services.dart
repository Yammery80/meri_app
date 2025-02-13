import 'package:mongo_dart/mongo_dart.dart' as mongo;

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
    _db = await mongo.Db.create('mongodb+srv://meribethperez27:Htacw8NUmYQLuOyt@cluster0.1pxhk.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0');
    await _db.open();
  }

  mongo.Db get db {
    if(!db.isConnected){
      throw StateError(
        'Base de datos no incializada, llama a connect() primero');
    }
    return _db;
  }


}