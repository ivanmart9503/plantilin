import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plantilin/src/blocs/client_provider.dart';
import 'package:plantilin/src/pages/home/home_page.dart';
import 'package:provider/provider.dart';

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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plantilín',
      theme: ThemeData(
        fontFamily: 'Overpass',
        primaryColor: Colors.green,
        accentColor: Colors.orangeAccent,
      ),
      // Uso de multiprovider
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<ClientProvider>.value(
            value: ClientProvider(),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
