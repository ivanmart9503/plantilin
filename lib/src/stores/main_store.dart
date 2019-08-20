import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:http/http.dart' as http;

part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  MqttClient client;

  PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  @observable
  int indexPage = 0;

  @observable
  String server = '';

  @observable
  int port = 0;

  @observable
  bool websockets = false;

  @observable
  bool isConnected = false;

  @observable
  String temperatureTopic = '';

  @observable
  String temperatureMessage = '';

  @observable
  String humidityTopic = '';

  @observable
  String humidityMessage = '';

  @observable
  String groundTopic = '';

  @observable
  String groundMessage = '';

  @observable
  String sprinklerTopic = '';

  @observable
  String sprinklerMessage = '';

  @observable
  List<dynamic> data = [];

  @action
  void onOffWebsockets() {
    websockets = !websockets;
    print(websockets);
  }

  @action
  void onPageChanged(int index) {
    indexPage = index;
  }

  @action
  void onTap(int index) {
    indexPage = index;
    pageController.animateToPage(
      indexPage,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  @action
  Future connect() async {
    print('conectando');
    final String tcpWebsocketsHost = websockets ? 'ws://$server' : server;
    client = MqttClient(tcpWebsocketsHost, 'plantilin${Random().nextInt(100)}');
    client.port = port;
    client.useWebSocket = websockets;
    client.logging(on: true);

    await client.connect();
    client.updates.listen(onMessage);

    print('conectado');
    if (client.connectionStatus.state == MqttConnectionState.connected) {
      isConnected = true;
    }
    print(isConnected);
  }

  @action
  void disconnect() {
    client.disconnect();
    temperatureTopic = '';
    temperatureMessage = '';
    humidityTopic = '';
    humidityMessage = '';
    groundTopic = '';
    groundMessage = '';
    sprinklerTopic = '';
    sprinklerMessage = '';
    if (client.connectionStatus.state != MqttConnectionState.connected) {
      isConnected = false;
    }
  }

  @action
  void subscribe(String type, String newTopic) {
    try {
      client.subscribe(newTopic, MqttQos.atLeastOnce);
      print('susbcribed');
    } catch (e) {
      print(e);
    }

    switch (type) {
      case 'temperature':
        temperatureTopic = newTopic;
        break;
      case 'humidity':
        humidityTopic = newTopic;

        break;
      case 'ground':
        groundTopic = newTopic;

        break;
      case 'sprinkler':
        sprinklerTopic = newTopic;

        break;
      default:
        break;
    }
  }

  @action
  void onMessage(List<MqttReceivedMessage> event) {
    final topic = event[0].topic;

    final MqttPublishMessage receivedMessage =
        event[0].payload as MqttPublishMessage;

    final String message = MqttPublishPayload.bytesToStringAsString(
        receivedMessage.payload.message);

    if (topic == temperatureTopic) {
      temperatureMessage = message;
      saveData('Temperatura', message).then(
        (response) => print(response),
      );
    }
    if (topic == humidityTopic) {
      humidityMessage = message;
      saveData('Humedad', message).then(
        (response) => print(response),
      );
    }
    if (topic == groundTopic) {
      groundMessage = message;
      saveData('Humedad de la tierra', message).then(
        (response) => print(response),
      );
    }
    if (topic == sprinklerTopic) {
      sprinklerMessage = message;
      saveData('Aspersores', message).then(
        (response) => print(response),
      );
    }
  }

  Future saveData(String type, String message) async {
    final Map<String, String> data = {
      'type': type,
      'data': message,
    };

    final response = await http.post('https://desolate-sierra-60744.herokuapp.com/plantilin',
        body: jsonEncode(data), headers: {"content-type": "application/json"});

    return response.body;
  }

  @action
  Future getData({reload: false}) async {
    if (reload || data.isEmpty) {
      final response = await http.get('https://desolate-sierra-60744.herokuapp.com/plantilin',
          headers: {'accept': 'application/json'});
      data = jsonDecode(response.body);
    }
  }
}
