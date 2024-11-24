import 'package:flutter/material.dart';
import 'screens/list_screen.dart'; // Asegúrate de que el nombre y la ruta sean correctos

void main() {
  runApp(const CorreoApp());
}

class CorreoApp extends StatelessWidget {
  const CorreoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Correos', // Título adaptado
      theme: ThemeData(
        primarySwatch: Colors.pink, // Cambiado a rosa para diferenciar
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PantallaLista(), // Cambiar a la clase que contiene la pantalla principal
    );
  }
}
