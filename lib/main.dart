import 'package:flutter/material.dart';
import 'screens/product_list_screen.dart'; // Importa la pantalla de lista de productos

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dkash Store',
      theme: ThemeData(
        brightness: Brightness.dark,  // Tema oscuro
        primaryColor: Colors.black,   // Color primario negro
        scaffoldBackgroundColor: Colors.black,  // Fondo negro
        textTheme: TextTheme(
          titleLarge: TextStyle(color: Colors.white), // Título grande en blanco
          bodyLarge: TextStyle(color: Colors.white),  // Texto de cuerpo grande en blanco
          bodyMedium: TextStyle(color: Colors.white), // Texto de cuerpo medio en blanco
          bodySmall: TextStyle(color: Colors.white),  // Texto de cuerpo pequeño en blanco
        ),
      ),
      home: ProductListScreen(),  // Establece la pantalla de lista de productos como pantalla inicial
    );
  }
}
