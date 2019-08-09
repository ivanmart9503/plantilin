import 'package:flutter/material.dart';

import 'package:plantilin/src/stores/main_store.dart';
import 'package:provider/provider.dart';

class DialogTopic {
  String _type;
  String _topic = '';
  DialogTopic(this._type);

  void showTopicDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: _buildDialog,
    );
  }

  SimpleDialog _buildDialog(BuildContext context) {
    final store = Provider.of<MainStore>(context);
    return SimpleDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Text(
        'Suscribir al canal',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
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
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
          child: RaisedButton(
            child: Text(
              'Suscribir',
              style: TextStyle(fontSize: 18.0),
            ),
            color: Colors.green,
            colorBrightness: Brightness.dark,
            onPressed: () {
              store.subscribe(_type, _topic);
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
