import 'dart:math';

import 'package:mqtt_client/mqtt_client.dart';

class Client {
  MqttClient client;

  Future<bool> connect(String server, int port) async {
    client = MqttClient(server, 'flutter${Random().nextInt(100)}');
    client.port = port;
    client.useWebSocket = true;
    client.logging(on: true);

    try {
      await client.connect();
    } catch (e) {
      print('An error ocurred $e');
      client.disconnect();
    }

    return client.connectionStatus.state == MqttConnectionState.connected;
  }

  bool disconnect() {
    client.disconnect();
    print(client.connectionStatus.state);
    return client.connectionStatus.state == MqttConnectionState.disconnected;
  }

  bool subscribe(newTopic) {
    print(newTopic);
    try {
      client.subscribe(newTopic, MqttQos.atLeastOnce);
      return true;
    } catch (e) {
      return false;
    }
  }
}
