import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:plantilin/src/stores/main_store.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context);
    return Observer(
      builder: (_) => Container(
        padding: EdgeInsets.only(top: 5.0),
        color: Colors.white,
        child: Observer(
          builder: (_) => store.isConnected
              ? Container(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey,
                    ),
                    itemCount: store.data.length,
                    itemBuilder: (context, int index) {
                      Map<String, dynamic> data = store.data[index];
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
