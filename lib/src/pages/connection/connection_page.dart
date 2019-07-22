import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plantilin/src/blocs/client_provider.dart';
import 'package:provider/provider.dart';

class ConnectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ClientProvider client = Provider.of<ClientProvider>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      color: Colors.white,
      child: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            _connectedLogo(width * 0.15, height * 0.15, client.isConnected),
            SizedBox(
              height: 30.0,
            ),
            _textFields(client),
          ],
        ),
      ),
    );
  }

  Widget _connectedLogo(double width, double height, bool connected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        connected
            ? SvgPicture.asset(
                'assets/link.svg',
                width: width,
                height: height,
              )
            : SvgPicture.asset(
                'assets/unlink.svg',
                width: width,
                height: height,
              ),
        SizedBox(
          height: 20.0,
        ),
        connected
            ? Text(
                'Conectado',
                style: TextStyle(fontSize: 18.0),
              )
            : Text(
                'Desconectado',
                style: TextStyle(fontSize: 18.0),
              ),
      ],
    );
  }

  Widget _textFields(ClientProvider client) {
    return Column(
      children: <Widget>[
        TextField(
          autofocus: true,
          decoration: InputDecoration(
            labelText: 'Servidor',
            hintText: '0.0.0.0',
            prefixText: 'ws://',
          ),
          onChanged: (String value) => client.server = 'ws://$value',
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Puerto',
            hintText: '1884',
          ),
          onChanged: (String value) => client.port = int.parse(value),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          width: double.infinity,
          child: RaisedButton(
            color: client.isConnected ? Colors.orange : Colors.green,
            textColor: Colors.white,
            child: Text(
              client.isConnected ? 'Desconectar' : 'Conectar',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            onPressed: client.isConnected ? client.disconnect : client.connect,
          ),
        ),
      ],
    );
  }
}
