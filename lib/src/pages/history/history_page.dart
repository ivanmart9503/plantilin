import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:plantilin/src/stores/main_store.dart';
import 'package:provider/provider.dart';

// Pagina del historial
class HistoryPage extends StatelessWidget {
  // Funcion principal que pinta la pagina en la pantalla
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context);
    return Observer(
      builder: (_) => Container(
        padding: EdgeInsets.only(top: 5.0),
        color: Colors.white,
        child: Observer(
          builder: (_) => store.isConnected
              // Contenedor principal del tamaño de la pantalla
              ? Container(
                  // Una lista con separadores
                  child: ListView.separated(
                    // El divider es la linea separadora
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey,
                    ),
                    // El itemCount se le pasa cuantos elementos pintar en pantalla
                    itemCount: store.data.length,
                    // Aqui se crea el elemento que se va a repetir
                    // el numero de veces que el itemCount tiene
                    itemBuilder: (context, int index) {
                      Map<String, dynamic> data = store.data[index];
                      // Con el list tile se pinta si es temperatura, humedad, etc.
                      // tambien el dato por ejemplo: 20 grados, 50 grados, 30 por ciento
                      // y al final la fecha de cuando se recibio ese dato
                      return ListTile(
                        title: Text(
                          data['type'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          data['data'],
                          style: TextStyle(
                            fontSize: 16,
                            // fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Text(
                          data['date'],
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    },
                  ),
                )
              // Si no esta conectado a un servidor mqtt no puede ver el historial
              // y se muestra un texto que dice eso
              : Center(
                  child: Text(
                    'Conéctate para ver el historial',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
