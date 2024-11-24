import 'package:flutter/material.dart';
import '../model/email.dart'; // Asegúrate de que apunte al archivo correcto

class PantallaDetalle extends StatelessWidget {
  final Correo correo; // Cambiado de Email a Correo

  const PantallaDetalle({super.key, required this.correo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(correo.asunto), // Cambiado a asunto
        foregroundColor: Colors.yellow,
        backgroundColor: Colors.blueGrey,
        iconTheme: const IconThemeData(color: Colors.yellow),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bloque del remitente
            Text(
              'De: ${correo.remitente}', // Cambiado de From a De
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Divider(), // Línea divisoria
            // Bloque del asunto y fecha
            Text(
              'Asunto: ${correo.asunto}', // Cambiado de subject
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
            Text(
              'Fecha: ${correo.fecha}', // Cambiado de Date
              style: TextStyle(color: Colors.grey[600], fontSize: 15),
            ),
            const Divider(), // Línea divisoria
            // Bloque del cuerpo del mensaje
            const SizedBox(height: 16),
            Text(
              correo.cuerpo, // Cambiado de body
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
