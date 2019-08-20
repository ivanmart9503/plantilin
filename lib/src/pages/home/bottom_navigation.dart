import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:plantilin/src/stores/main_store.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context);
    return Observer(
      builder: (_) => BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedLabelStyle: TextStyle(fontSize: 14.0),
        unselectedLabelStyle: TextStyle(fontSize: 14.0),
        iconSize: 30.0,
        unselectedItemColor: Colors.grey[400],
        selectedItemColor: Colors.grey[600],
        currentIndex: store.indexPage,
        onTap: store.onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            title: Text('Conexión'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_florist),
            title: Text('Datos planta'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('Historial'),
          ),
        ],
      ),
    );
  }
}
