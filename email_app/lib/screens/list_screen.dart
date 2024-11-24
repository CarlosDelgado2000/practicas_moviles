import 'package:flutter/material.dart';
import '../model/email.dart'; // Cambiar a `correo.dart` si renombraste el archivo
import '../widgets/email_widget.dart';
import '../model/backend.dart';

class PantallaLista extends StatefulWidget {
  const PantallaLista({super.key});

  @override
  _PantallaListaState createState() => _PantallaListaState();
}

class _PantallaListaState extends State<PantallaLista> {
  List<Correo> correos = []; // Cambiado de Email a Correo

  @override
  void initState() {
    super.initState();
    cargarCorreos();
  }

  void cargarCorreos() async {
    correos = await Backend().obtenerCorreos();
    setState(() {});
  }

  void marcarComoLeido(int id) {
    Backend().marcarComoLeido(id);
    setState(() {
      correos.firstWhere((correo) => correo.id == id).leido = true;
    });
  }

  void eliminarCorreo(int id) {
    Backend().eliminarCorreo(id);
    setState(() {
      correos.removeWhere((correo) => correo.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de Correos',
          style: TextStyle(
            color: Colors.yellow, // Color del texto del AppBar
          ),
        ),
        backgroundColor: Colors.blueGrey, // Color de fondo del AppBar
        iconTheme: const IconThemeData(color: Colors.yellow),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: correos.length,
        itemBuilder: (context, index) {
          final correo = correos[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Dismissible(
              key: Key(correo.id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) => eliminarCorreo(correo.id),
              background: Container(color: const Color.fromARGB(255, 236, 145, 106)),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
                ),
                elevation: 2.0, // Sombras para dar relieve al Card
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EmailWidget(
                    correo: correo, // Cambiado de email a correo
                    onMarcarComoLeido: () => marcarComoLeido(correo.id), // Nombre corregido
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
