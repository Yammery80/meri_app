import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData tema1(){
return ThemeData(
  //Fondo Color
  scaffoldBackgroundColor: Colors.white,
  //Barra de app
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    titleTextStyle: GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 20,
     ),
    ),
    //Estilos de texto
    // Estilos de texto
    textTheme: TextTheme(
      // Títulos
      headlineMedium: GoogleFonts.langar(
        color: Colors.teal[800],
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}