import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:provider/provider.dart';

import 'package:plantilin/src/pages/home/bottom_navigation.dart';
import 'package:plantilin/src/pages/connection/connection_page.dart';
import 'package:plantilin/src/pages/history/history_page.dart';
import 'package:plantilin/src/pages/plant/plant_page.dart';
import 'package:plantilin/src/stores/main_store.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context);
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            'Plantilín',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.black,
            ),
          ),
          actions: [
            store.indexPage == 2
                ? IconButton(
                    icon: Icon(Icons.refresh),
                    color: Colors.black,
                    onPressed: () async {
                      if (store.indexPage == 2) {
                        await store.getData(reload: true);
                      } else {
                        return;
                      }
                    },
                  )
                : Container(),
            // IconButton(
            //   icon: Icon(Icons.help_outline),
            //   color: Colors.black,
            //   onPressed: () {},
            // )
          ],
        ),
        body: _buildPageView(store),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }

  Widget _buildPageView(MainStore store) {
    return Observer(
      builder: (_) => PageView(
        controller: store.pageController,
        onPageChanged: store.onPageChanged,
        children: <Widget>[
          ConnectionPage(),
          PlantPage(),
          HistoryPage(),
        ],
      ),
    );
  }
}
