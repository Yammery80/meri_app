import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData tema1(){
return ThemeData(
  //Fondo Color
  scaffoldBackgroundColor: Colors.white,
  //Barra de app
  appBarTheme: AppBarTheme(
    backgroundColor: const Color.fromARGB(255, 4, 93, 93),
    titleTextStyle: GoogleFonts.aboreto(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
     ),
     iconTheme: const IconThemeData(
       color: Colors.white, //Iconos de la AppBar
     ),
    ),
    // Estilos de texto
    textTheme: TextTheme(
      // Títulos
      headlineMedium: GoogleFonts.aboreto(
        color: const Color.fromARGB(255, 4, 93, 93),
        fontSize: 18,
      ),
    ),
    //Botones
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 4, 93, 93), // Color del botón
        foregroundColor: Colors.white, // Color del texto/icono
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        textStyle: GoogleFonts.aboreto(fontSize: 16, fontWeight: FontWeight.w900),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // Bordes redondeados
        ),
      ),
    ),
  );
}