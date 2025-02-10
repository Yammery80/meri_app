import 'package:dart_application_1/figura_geometrica.dart';

class Cuadrado extends FiguraGeometrica{
  double lado;

  Cuadrado({required this.lado});

  @override
  double calcularArea(){
    return lado * lado;
  }
}