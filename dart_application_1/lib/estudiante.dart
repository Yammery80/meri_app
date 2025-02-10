import 'package:dart_application_1/persona.dart';

class Estudiante extends Persona {
  String? matricula; //Elvis = ?
  String? promedio;

  @override
  String toString(){
    return ("Estudiante => Nombre: $nombre, Edad: $edad, matricula: $matricula, promedio: $promedio");
  }
}