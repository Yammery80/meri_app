import 'package:dart_application_1/figura_geometrica.dart';

class Triangulo extends FiguraGeometrica{
  double? base;
  double? altura; 

  @override
  double calcularArea(){
    return base! * altura! / 2;
  }
}
