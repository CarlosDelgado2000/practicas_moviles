import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../model/email.dart';
import '../screens/detail_screen.dart'; 

class EmailWidget extends StatelessWidget {
  final Correo correo; 
  final VoidCallback onMarcarComoLeido; 

  const EmailWidget({
    super.key,
    required this.correo,
    required this.onMarcarComoLeido,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        correo.asunto, 
        style: TextStyle(
          fontWeight: correo.leido ? FontWeight.normal : FontWeight.bold,
          color: correo.leido ? Colors.grey : Colors.black,
        ),
      ),
      subtitle: Text(correo.remitente),
      trailing: correo.leido
          ? null 
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  FontAwesomeIcons.dove, // Ícono de paloma
                  color: Colors.blue, // Color de la paloma
                  size: 16,
                ),
                const SizedBox(width: 4), // Espaciado entre los íconos
                Icon(
                  Icons.mail, // Ícono de sobre
                  color: Colors.orange, // Color del sobre
                  size: 16,
                ),
              ],
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
