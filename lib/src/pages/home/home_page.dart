import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:plantilin/src/blocs/client_provider.dart';

import 'package:plantilin/src/pages/connection/connection_page.dart';
import 'package:plantilin/src/pages/history/history_page.dart';
import 'package:plantilin/src/pages/plant/plant_page.dart';
import 'package:plantilin/src/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indexPage = 0;
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: _indexPage, keepPage: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ClientProvider client = Provider.of<ClientProvider>(context);
    return Scaffold(
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
          IconButton(
            icon: Icon(MdiIcons.helpCircleOutline),
            color: Colors.black,
            onPressed: () {},
          )
        ],
      ),
      body: _buildPageView(client),
      bottomNavigationBar: BottomNavigation(_onTap, _indexPage),
    );
  }

  void _onTap(int index) {
    setState(() {
      _indexPage = index;
    });
    _pageController.animateToPage(
      _indexPage,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _indexPage = index;
    });
  }

  Widget _buildPageView(ClientProvider client) {
    return PageView(
      controller: _pageController,
      onPageChanged: _onPageChanged,
      children: <Widget>[
        ConnectionPage(),
        client.isConnected
            ? PlantPage()
            : Center(
                child: Text('No estas conectado...'),
              ),
        client.isConnected
            ? HistoryPage()
            : Center(
                child: Text('No estas conectado...'),
              ),
      ],
    );
  }
}
