class Correo {
  final int id; // Identificador único del correo
  final String remitente; // Dirección de correo del remitente
  final String asunto; // Asunto del correo
  final String cuerpo; // Contenido del correo
  final String fecha; // Fecha de recepción
  bool leido; // Indica si el correo ha sido leído

  Correo({
    required this.id,
    required this.remitente,
    required this.asunto,
    required this.cuerpo,
    required this.fecha,
    this.leido = false, // Por defecto, el correo está sin leer
  });

  // Método para marcar el correo como leído
  void marcarComoLeido() {
    leido = true;
  }
}
