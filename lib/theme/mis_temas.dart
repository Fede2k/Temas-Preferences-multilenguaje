import 'package:flutter/material.dart';

class MisTemas {
  final ThemeData _temaClaro = ThemeData.light().copyWith(
    useMaterial3: true,
    appBarTheme:
        const AppBarTheme(backgroundColor: Color.fromARGB(255, 146, 192, 238)),
  );

  final ThemeData _temaOscuro = ThemeData.dark().copyWith(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(),
  );

  get temaClaro => _temaClaro;
  get temaOscuro => _temaOscuro;
}
