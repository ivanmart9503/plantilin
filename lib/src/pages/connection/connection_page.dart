import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:plantilin/src/stores/main_store.dart';

class ConnectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 35.0),
      color: Colors.white,
      child: Center(
        child: Observer(
          builder: (_) => ListView(
            children: <Widget>[
              _connectedLogo(width * 0.15, height * 0.15, store),
              SizedBox(
                height: 30.0,
              ),
              _textFields(store),
            ],
          ),
        ),
      ),
    );
  }

  Widget _connectedLogo(double width, double height, MainStore store) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        !store.isConnected
            ? SvgPicture.asset(
                'assets/unlink.svg',
                width: width,
                height: height,
              )
            : SvgPicture.asset(
                'assets/link.svg',
                width: width,
                height: height,
              ),
        SizedBox(
          height: 20.0,
        ),
        !store.isConnected
            ? Text(
                'Desconectado',
                style: TextStyle(fontSize: 18.0),
              )
            : Text(
                'Conectado',
                style: TextStyle(fontSize: 18.0),
              ),
      ],
    );
  }

  Widget _textFields(MainStore store) {
    return Column(
      children: <Widget>[
        TextField(
          enabled: !store.isConnected,
          decoration: InputDecoration(
            labelText: 'Servidor',
            hintText: '0.0.0.0',
            // prefixIcon: Padding(
            //   padding: EdgeInsets.only(right: 10.0),
            //   child: Icon(Icons.cloud),
            // ),
          ),
          onChanged: (String value) => store.server = value,
        ),
        TextField(
          enabled: !store.isConnected,
          decoration: InputDecoration(
            labelText: 'Puerto',
            hintText: 'tcp: 1883 ws: 9001',
            // prefixIcon: Padding(
            //   padding: EdgeInsets.only(right: 10.0),
            //   child: Icon(Icons.dns),
            // ),
          ),
          keyboardType: TextInputType.number,
          onChanged: (String value) => store.port = int.parse(value),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Usar websockets',
              style: TextStyle(fontSize: 16.0),
            ),
            Observer(
              builder: (_) => Switch(
                activeColor: Colors.green[200],
                onChanged: (value) =>
                    store.isConnected ? null : store.onOffWebsockets(),
                value: store.websockets,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          width: double.infinity,
          child: RaisedButton(
            color: store.isConnected ? Colors.orange : Colors.green,
            textColor: Colors.white,
            child: Text(
              store.isConnected ? 'Desconectar' : 'Conectar',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            onPressed: () async {
              if (store.isConnected) {
                store.disconnect();
                return;
              }

              await store.connect();
            },
          ),
        ),
      ],
    );
  }
}
