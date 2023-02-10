import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:preftemaapp/generated/l10n.dart';

import 'package:provider/provider.dart';

import 'package:preftemaapp/providers/theme_provider.dart';
import 'package:preftemaapp/preferences/preferencias_usuario.dart';
import 'package:preftemaapp/theme/mis_temas.dart';
import 'package:preftemaapp/pages/homepage.dart';

void main() async {
  // cuando se coloque código en el main debe esperar a iniciarse
  // y usemos async y await
  // es necesario colocar la siguiente linea
  WidgetsFlutterBinding.ensureInitialized();

  // se inicializan las preferencias
  final PreferenciasUsuario pref = PreferenciasUsuario();
  await pref.initPref();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MisTemas misTemas = MisTemas();
    final temaProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //* Temas
      themeMode: temaProvider.temaActual,
      theme: misTemas.temaClaro,
      darkTheme: misTemas.temaOscuro,

      //* Rutas
      initialRoute: 'homepage',
      routes: {
        'homepage': ((context) => const HomePage()),
      },

      //
      //************************ soporte para idiomas ************************
      //
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
