import 'package:flutter/material.dart';
import 'package:preftemaapp/preferences/preferencias_usuario.dart';

class ThemeProvider with ChangeNotifier {
  final PreferenciasUsuario _pref = PreferenciasUsuario();

  ThemeMode temaActual = ThemeMode.light;
  bool _isDark = false;
  Icon iconFloating = const Icon(Icons.dark_mode_outlined);

  ThemeProvider() {
    _isDark = _pref.isDark;
    _cambiaTema();
  }

  Future<void> _cambiaTema() async {
    if (_isDark) {
      temaActual = ThemeMode.dark;
      iconFloating = const Icon(Icons.dark_mode_outlined);
    } else {
      temaActual = ThemeMode.light;
      iconFloating = const Icon(Icons.light_mode_outlined);
    }
  }

  bool get isDark => _isDark;
  set isDark(bool val) {
    _isDark = val;
    _cambiaTema();
    notifyListeners();
  }
}
