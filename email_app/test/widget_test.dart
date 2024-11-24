import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:email_app/main.dart'; // Ruta relativa al archivo main.dart

void main() {
  testWidgets('Carga inicial de correos y marca como leído', (WidgetTester tester) async {
    // Construye la aplicación y dibuja el primer frame.
    await tester.pumpWidget(const CorreoApp());

    // Verifica que se muestra la pantalla principal con el título.
    expect(find.text('Lista de Correos'), findsOneWidget);

    // Verifica que al menos un correo está visible.
    expect(find.byType(ListTile), findsWidgets);

    // Toca el primer correo en la lista.
    final firstCorreo = find.byType(ListTile).first;
    await tester.tap(firstCorreo);
    await tester.pumpAndSettle(); // Espera a que la animación de navegación termine.

    // Verifica que se muestra la pantalla de detalle del correo.
    expect(find.textContaining('Novedades en Dart 3.0'), findsWidgets);

    // Regresa a la pantalla principal.
    await tester.pageBack();
    await tester.pumpAndSettle();

    // Verifica que el correo tocado ha sido marcado como leído.
    expect(find.byIcon(Icons.circle), findsWidgets); // El ícono rojo debería desaparecer.
  });
}
