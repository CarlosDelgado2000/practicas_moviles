import 'package:flutter/material.dart';
import '../model/email.dart';
import '../screens/detail_screen.dart'; // Asegúrate de que esta ruta coincida con tu estructura

class EmailWidget extends StatelessWidget {
  final Correo correo; // Cambiado a Correo
  final VoidCallback onMarcarComoLeido; // Cambiado a español

  const EmailWidget({
    super.key,
    required this.correo,
    required this.onMarcarComoLeido,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        correo.asunto, // Cambiado a asunto
        style: TextStyle(
          fontWeight: correo.leido ? FontWeight.normal : FontWeight.bold,
          color: correo.leido ? Colors.grey : Colors.black,
        ),
      ),
      subtitle: Text(correo.remitente), // Cambiado a remitente
      trailing: correo.leido
          ? null // No mostrar el punto si ya está leído
          : Container(
              width: 10.0,
              height: 10.0,
              decoration: const BoxDecoration(
                color: Colors.red, // Color del punto
                shape: BoxShape.circle,
              ),
            ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PantallaDetalle(correo: correo), // Navega a PantallaDetalle
          ),
        ).then((_) {
          // Llama al callback para marcar como leído después de ver el detalle
          onMarcarComoLeido();
        });
      },
    );
  }
}
