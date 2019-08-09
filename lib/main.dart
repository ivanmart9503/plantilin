import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:plantilin/src/pages/home/home_page.dart';
import 'package:plantilin/src/stores/main_store.dart';

void main() => runApp(Plantilin());

class Plantilin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Cambiar de color la barra de estado y navegacion
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );

    return MultiProvider(
      providers: [
        Provider<MainStore>(builder: (_) => MainStore()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Plantilín',
        theme: ThemeData(
          fontFamily: 'Overpass',
          primaryColor: Colors.green,
          accentColor: Colors.orangeAccent,
        ),
        // Uso de multiprovider
        home: HomePage(),
      ),
    );
  }
}
