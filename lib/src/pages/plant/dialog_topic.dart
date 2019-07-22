import 'package:flutter/material.dart';
import 'package:plantilin/src/blocs/client_provider.dart';

class DialogTopic {
  String _type;
  String _topic = '';
  ClientProvider _client;
  DialogTopic(this._type, this._client);

  void showTopicDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: _buildDialog,
    );
  }

  SimpleDialog _buildDialog(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Text(
        'Suscribir al canal',
        textAlign: TextAlign.center,
      ),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Canal',
              hintText: 'topic...',
              prefixText: 'plantilin/',
            ),
            onChanged: (value) => _topic = 'plantilin/$value',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: RaisedButton(
            child: Text('Suscribir'),
            color: Colors.green,
            colorBrightness: Brightness.dark,
            onPressed: () => _client.subscribeToTopic(_type, _topic),
          ),
        ),
      ],
    );
  }
}
