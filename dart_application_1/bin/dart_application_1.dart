// //Usando un alias para la libreria importada
// import 'package:dart_application_1/cuadrado.dart';
// // import 'package:dart_application_1/estudiante.dart';
// // import 'package:dart_application_1/figura_geometrica.dart';
// // import 'package:dart_application_1/funciones.dart' as funciones;
// // import 'package:dart_application_1/heroe.dart';
// // import 'package:dart_application_1/persona.dart';
// import 'package:dart_application_1/triangulo.dart';

void main(List<String> arguments) async{
  // var x;
  // const y=10.2;
  // final z;
  // x = 10;

  // print('Hello world!');
  // print('El valor de x es: $x');
  // x='hola';
  // print('El valor de x es: $x');
  // print('El valor de y es: $y');
  // z= true;
  // print('El valor de y es: $z');

  //Colecciones

  // List<int> nums1 = [2, 4, 6, 8, 10];
  // print(nums1);
  // nums1.add(12);
  // print(nums1);

  // final nums2 = List.generate(100, (index) => "Hola Gael"); //Función anonima
  // print(nums2);  
  // nums2.add("Hola");
  // print(nums2);  
  // print('El primer elemento de la lista es: ${nums2.first}');
  // print('El longitud de nums2 de la lista es: ${nums2.length}');
  // print('El ultimo elemento de la lista es: ${nums2.last}');
  // print('¿Esta vacía la lista?: ${nums2.isEmpty}');

  //Mapas
  // Map<String, dynamic> persona = {
  //   'nombre': 'Michael',
  //   'edad': 19,
  //   'soltero': false,
  //   'money': true,
  //   'hijos': null,
  // };
  // print('El partidazo es : $persona');

  
  // var dias = <int, String>{
  //   1: 'Lunes',
  //   2: 'Martes',
  //   3: 'Miercoles',
  //   4: 'Jueves',
  //   5: 'Viernes',
  //   6: 'Sabado',
  //   7: 'Domingo',
  // };

  // print('Los días son: $dias'); 
  // print(dias.values);
  // print('Las claves son: ${dias.keys}');
  // dias[4] = 'Jueves'; //Agrega un par clave-valor
  // dias[8] = 'Domingo'; //Modifica el valor de una llave que ya existe
  // dias.putIfAbsent(5, () => 'Viernes'); //Agrega un par clave-valor si la clave no existe
  // dias.putIfAbsent(2, () => 'Viernes'); //Agrega un par clave-valor si la clave no existe
  // print('Los días antes de eliminar son: $dias');
  // dias.remove(2); //Elimina un par clave-valor
  // print('Los días despuès de eliminar son: $dias');
  // dias.clear(); //Elimina todos los elementos del mapa
  // dias.isEmpty; //Verifica si el mapa esta vacío
  // dias.isNotEmpty; //Verifica si el mapa no esta vacío
  // dias.length; //Devuelve la cantidad de elementos del mapa
  // dias.entries; //Devuelve una colección de pares clave-valor
  // dias.keys; //Devuelve una colección de las claves
  //dias.forEach(action); //Recorre el mapa y ejecuta una acción
  // dias.removeWhere((key,value) => value.startsWith('M')); //Elimina los elementos que cumplan con una condición
  // print('Los días despuès de eliminar son: $dias');

  // var numeros = <String, int>{
  //   'num1': 2,
  //   'num2': 4,
  //   'num3': 6,
  //   'num4': 8,
  //   'num5': 10,
  // };
  // for (var e in numeros.entries) {
  //   print('Llave: ${e.key}');
  //   print('Valor: ${e.value}');
  // }

  // for (var e in numeros.entries) {
 //  print('Clave: ${e.key}: Valor: ${e.value*2}');
//}
//Invocacion o llamado
// var sum = suma(12, 8);
// print('La suma es: $sum');
// print(saludar1(mensaje: 'Hola amiga', nombre: 'Tomatina'));
// print(saludar2());
// print(saludar2('Hi'));
// print(saludar2('Hello', 'Filomena'));
//print('El área del triángulo es: ${funciones.triangulo(b: 12.3, a: 14.6)}');
//print('El área del circulo es: ${funciones.circulo(r: 1)}');

//Invocando a la funcion Future
httpGet('https://api.nasa.org').then((data) => print(data));

//Invocando a una funcion asincrona (async)
// print(getNombre(20)); //Esto no espera, y no se obtiene los datos
final nombre =await getNombre(20); //Espera a que se obtengan los datos
print('El nombre del usuario es: $nombre'); //Imprime el nombre del usuario

// //unaPersona es una variable de instancia
// var unaPersona = Persona();
// unaPersona.edad = 25;
// unaPersona.nombre = 'Rufina';
// print('Información de una Persona : ${unaPersona.toString()}');

// //unaPersona es una variable de instancia
// Persona otraPersona = Persona();
// otraPersona.edad = 25;
// otraPersona.nombre = 'Tránsito';
// print('Información de una Persona : ${otraPersona.toString()}');

// Heroe superman = Heroe(nombre:'Clark Kent', superPoder: 'El hombre de acero');
// print('Información de un Heroe : ${superman.toString()}');

// Estudiante unEstudiante = Estudiante();
// unEstudiante.nombre = 'Teófila';
// unEstudiante.edad = 20;
// unEstudiante.matricula = '2024IDGS001';
// unEstudiante.promedio = '9.8';
// print('Información de Estudiante: ${unEstudiante.toString()}');

// Triangulo unTriangulo = Triangulo();
// unTriangulo.base = 10;
// unTriangulo.altura = 1.5;
// print('El área del triángulo es: ${unTriangulo.calcularArea()}');
// Cuadrado unCuadrado = Cuadrado(lado:12.8);
// print('El área de un cuadrado es: ${unCuadrado.calcularArea()}');

}
//Definicion de la funcion
// int suma(int x, int y){ //Declaracion 
//   int z;
//   z = x + y;
//   return z;
// }

// String saludar1({required String mensaje, required String nombre}){ //Nombrados
//   return '$mensaje $nombre';
// }

// String saludar2([String mensaje='Hola', String nombre='Fulano']){ //Opcionales
//   return '$mensaje $nombre';
// }

Future<String> httpGet(String url){
  //aqui hay muchas acciones
  return Future.delayed(Duration(seconds: 1), (){
    return 'Datos de los aliens encontrados';
  }); 
}

//Funcion asincrona
Future<String> getNombre(int id) async{
  return '$id: Tranquilino';
}