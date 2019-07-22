import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';

import 'package:plantilin/src/blocs/client.dart';

class ClientProvider with ChangeNotifier {
  String server = '';
  int port = 0;
  bool isConnected = false;
  Client _client = Client();
  Map<String, String> temperature = {};
  Map<String, String> humidity = {};
  Map<String, String> ground = {};
  Map<String, String> sprinkler = {};

  Future<void> connect() async {
    await _client.connect(server, port).then(
      (value) {
        isConnected = value;
        notifyListeners();
        print(isConnected);
      },
    );
    _client.client.updates.listen(onMessage);
  }

  void disconnect() {
    isConnected = _client.disconnect();
    notifyListeners();
  }

  // void subscribe() {
  //   _client.subscribe('plantilin/temperature');
  // }

  void subscribeToTopic(String type, String topic) {
    switch (type) {
      case 'Temperature':
        temperature[topic] = '';
        break;
      case 'Humidity':
        humidity[topic] = '';
        break;
      case 'Ground':
        ground[topic] = '';
        break;
      case 'Sprinkler':
        sprinkler[topic] = '';
        break;
      default:
    }
    _client.subscribe(topic);
  }

  void onMessage(List<MqttReceivedMessage> event) {
    final MqttPublishMessage receivedMessage =
        event[0].payload as MqttPublishMessage;
    final String message = MqttPublishPayload.bytesToStringAsString(
        receivedMessage.payload.message);

    if (temperature.containsKey(event[0].topic))
      temperature[event[0].topic] = message;
    if (humidity.containsKey(event[0].topic))
      humidity[event[0].topic] = message;
    if (ground.containsKey(event[0].topic)) ground[event[0].topic] = message;
    if (sprinkler.containsKey(event[0].topic))
      sprinkler[event[0].topic] = message;
    notifyListeners();
  }
}
