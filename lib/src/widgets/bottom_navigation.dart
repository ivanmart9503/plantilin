import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavigation extends StatelessWidget {
  final Function onTap;
  final int indexPage;

  BottomNavigation(this.onTap, this.indexPage);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: indexPage,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(MdiIcons.wifiStrength4),
          title: Text('Conexión'),
        ),
        BottomNavigationBarItem(
          icon: Icon(MdiIcons.flowerTulip),
          title: Text('Datos planta'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          title: Text('Historial'),
        ),
      ],
    );
  }
}
