import 'package:flutter/material.dart';
import 'package:preftemaapp/generated/l10n.dart';

import 'package:provider/provider.dart';

import 'package:preftemaapp/providers/theme_provider.dart';
import 'package:preftemaapp/preferences/preferencias_usuario.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PreferenciasUsuario pref = PreferenciasUsuario();
    final temaProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
      ),
      body: const BotonSnackBar(),
      floatingActionButton: FloatingActionButton(
          child: temaProvider.iconFloating,
          onPressed: () {
            temaProvider.isDark = !temaProvider.isDark;
            pref.isDark = temaProvider.isDark;
          }),
    );
  }
}

class BotonSnackBar extends StatelessWidget {
  const BotonSnackBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          showDatePicker(
              context: context,
              initialDate: DateTime(2022),
              firstDate: DateTime(1971),
              lastDate: DateTime(2025));
          final snakck = SnackBar(
            // la clase S contiene la referencia a las palbras en su idioma
            action: SnackBarAction(label: S.of(context).undo, onPressed: () {}),
            content: Text(
              // a  la referencia del archivo s se le pueden pasar variables
              S.of(context).helloMsr('Fede'),
              style: const TextStyle(color: Colors.white70),
            ),
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.black54,
          );
          ScaffoldMessenger.of(context).showSnackBar(snakck);
        },
        child: Text(S.of(context).hello),
      ),
    );
  }
}
