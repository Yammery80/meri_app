import 'package:mongo_dart/mongo_dart.dart' as mongo ;

class SongsModel{
  final mongo.ObjectId id;
  String name;
  String singer;
  int mins;

  SongsModel({
    required this.id,
    required this.name,
    required this.singer,
    required this.mins,
  });
  //Convertir de Dart a json para enviarle a atlas
//Se usará para insertar y editar
  Map<String, dynamic> toJson(){
    return {
      '_id': id,
      'name': name,
      'singer': singer,
      'mins': mins
    };
  }
  //Convertir de json a Dart cuando se recupera de atlas
//Se usará para select
  factory SongsModel.fromJson(Map<String, dynamic> json){
    var id = json['_id'];

    //Para verificar que sea del tipo ObjectId
    if(id is String ){
      try{
        id = mongo.ObjectId.fromHexString(id);

      }catch(e){
        id = mongo.ObjectId();
      }
    }else if ( id is! mongo.ObjectId){
      id = mongo.ObjectId();
    }

    return SongsModel(
      id: id as mongo.ObjectId, 
      name: json['name'] as String, 
      singer: json['singer'] as String, 
      mins: json['mins'] as int
      );
  }
}