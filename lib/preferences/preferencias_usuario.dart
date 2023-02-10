import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
//Patron singleton -------------------------------
  static final PreferenciasUsuario _initState = PreferenciasUsuario._interna();

  factory PreferenciasUsuario() {
    return _initState;
  }

  PreferenciasUsuario._interna();
//------------------------------------------------

  late SharedPreferences _pref;

  initPref() async {
    _pref = await SharedPreferences.getInstance();
  }

  //GET y SET del tema

  bool get isDark {
    return _pref.getBool('isDark') ?? false;
  }

  set isDark(bool valor) {
    _pref.setBool('isDark', valor);
  }
}
