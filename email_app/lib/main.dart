import 'package:flutter/material.dart';
import 'screens/list_screen.dart';

void main() {
  runApp(const CorreoApp());
}

class CorreoApp extends StatelessWidget {
  const CorreoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Correos', 
      theme: ThemeData(
        primarySwatch: Colors.pink, 
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PantallaLista(), 
    );
  }
}
