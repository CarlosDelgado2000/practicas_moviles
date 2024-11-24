import 'email.dart';

class Backend {
  final List<Correo> _correos = [
    Correo(
      id: 1,
      asunto: 'Novedades en Dart 3.0',
      remitente: 'novedades@dartlang.org',
      cuerpo: 'Explora las nuevas características de Dart 3.0 en nuestra última publicación.',
      fecha: '2023-10-01',
    ),
    Correo(
      id: 2,
      asunto: 'Tips de desarrollo en Flutter',
      remitente: 'tips@flutter.dev',
      cuerpo: 'Mejora tus habilidades de Flutter con estos 5 consejos útiles.',
      fecha: '2023-10-02',
    ),
    Correo(
      id: 3,
      asunto: 'Próximos eventos de Google IO',
      remitente: 'eventos@google.com',
      cuerpo: 'Prepárate para el próximo Google IO con sesiones exclusivas sobre tecnología.',
      fecha: '2023-10-03',
    ),
    Correo(
      id: 4,
      asunto: 'Actualizaciones en Kotlin 1.7',
      remitente: 'actualizaciones@kotlinlang.org',
      cuerpo: 'Conoce las mejoras que trae Kotlin en su nueva versión 1.7.',
      fecha: '2023-10-04',
    ),
    Correo(
      id: 5,
      asunto: 'Node.js: Mejores prácticas',
      remitente: 'node@devcommunity.com',
      cuerpo: 'Descubre cómo escribir código más eficiente con Node.js.',
      fecha: '2023-10-05',
    ),
    Correo(
      id: 6,
      asunto: 'Machine Learning con Python',
      remitente: 'ml@python.ai',
      cuerpo: 'Introducción al aprendizaje automático con Python: recursos y tutoriales.',
      fecha: '2023-10-06',
    ),
    Correo(
      id: 7,
      asunto: 'React: Consejos para optimización',
      remitente: 'react@frontend.com',
      cuerpo: 'Aprende a optimizar tus aplicaciones React con estos trucos.',
      fecha: '2023-10-07',
    ),
    Correo(
      id: 8,
      asunto: '¡Bienvenido a nuestra comunidad!',
      remitente: 'info@comunidadflutter.com',
      cuerpo: 'Gracias por unirte a nuestra comunidad. Comienza explorando estos recursos.',
      fecha: '2023-10-08',
    ),
    Correo(
      id: 9,
      asunto: 'Angular vs React: ¿Cuál elegir?',
      remitente: 'comparativas@webframeworks.dev',
      cuerpo: 'Una comparación completa entre Angular y React para 2023.',
      fecha: '2023-10-09',
    ),
    Correo(
      id: 10,
      asunto: 'Prácticas avanzadas en DevOps',
      remitente: 'devops@enterprise.com',
      cuerpo: 'Explora las mejores prácticas avanzadas en DevOps para grandes empresas.',
      fecha: '2023-10-10',
    ),
  ];

  // Método para obtener la lista de correos
  Future<List<Correo>> obtenerCorreos() async {
    await Future.delayed(Duration(seconds: 1));
    return _correos;
  }

  // Método para marcar un correo como leído
  Future<void> marcarComoLeido(int id) async {
  try {
    final correo = _correos.firstWhere((correo) => correo.id == id);
    correo.leido = true;
  } catch (e) {
    // Manejo en caso de que no se encuentre el correo (opcional)
    print('Correo con ID $id no encontrado: $e');
  }
}


  // Método para eliminar un correo
  Future<void> eliminarCorreo(int id) async {
    _correos.removeWhere((correo) => correo.id == id);
  }
}
