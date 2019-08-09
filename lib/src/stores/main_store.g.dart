// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$MainStore on _MainStore, Store {
  final _$indexPageAtom = Atom(name: '_MainStore.indexPage');

  @override
  int get indexPage {
    _$indexPageAtom.context.enforceReadPolicy(_$indexPageAtom);
    _$indexPageAtom.reportObserved();
    return super.indexPage;
  }

  @override
  set indexPage(int value) {
    _$indexPageAtom.context.conditionallyRunInAction(() {
      super.indexPage = value;
      _$indexPageAtom.reportChanged();
    }, _$indexPageAtom, name: '${_$indexPageAtom.name}_set');
  }

  final _$serverAtom = Atom(name: '_MainStore.server');

  @override
  String get server {
    _$serverAtom.context.enforceReadPolicy(_$serverAtom);
    _$serverAtom.reportObserved();
    return super.server;
  }

  @override
  set server(String value) {
    _$serverAtom.context.conditionallyRunInAction(() {
      super.server = value;
      _$serverAtom.reportChanged();
    }, _$serverAtom, name: '${_$serverAtom.name}_set');
  }

  final _$portAtom = Atom(name: '_MainStore.port');

  @override
  int get port {
    _$portAtom.context.enforceReadPolicy(_$portAtom);
    _$portAtom.reportObserved();
    return super.port;
  }

  @override
  set port(int value) {
    _$portAtom.context.conditionallyRunInAction(() {
      super.port = value;
      _$portAtom.reportChanged();
    }, _$portAtom, name: '${_$portAtom.name}_set');
  }

  final _$websocketsAtom = Atom(name: '_MainStore.websockets');

  @override
  bool get websockets {
    _$websocketsAtom.context.enforceReadPolicy(_$websocketsAtom);
    _$websocketsAtom.reportObserved();
    return super.websockets;
  }

  @override
  set websockets(bool value) {
    _$websocketsAtom.context.conditionallyRunInAction(() {
      super.websockets = value;
      _$websocketsAtom.reportChanged();
    }, _$websocketsAtom, name: '${_$websocketsAtom.name}_set');
  }

  final _$isConnectedAtom = Atom(name: '_MainStore.isConnected');

  @override
  bool get isConnected {
    _$isConnectedAtom.context.enforceReadPolicy(_$isConnectedAtom);
    _$isConnectedAtom.reportObserved();
    return super.isConnected;
  }

  @override
  set isConnected(bool value) {
    _$isConnectedAtom.context.conditionallyRunInAction(() {
      super.isConnected = value;
      _$isConnectedAtom.reportChanged();
    }, _$isConnectedAtom, name: '${_$isConnectedAtom.name}_set');
  }

  final _$temperatureTopicAtom = Atom(name: '_MainStore.temperatureTopic');

  @override
  String get temperatureTopic {
    _$temperatureTopicAtom.context.enforceReadPolicy(_$temperatureTopicAtom);
    _$temperatureTopicAtom.reportObserved();
    return super.temperatureTopic;
  }

  @override
  set temperatureTopic(String value) {
    _$temperatureTopicAtom.context.conditionallyRunInAction(() {
      super.temperatureTopic = value;
      _$temperatureTopicAtom.reportChanged();
    }, _$temperatureTopicAtom, name: '${_$temperatureTopicAtom.name}_set');
  }

  final _$temperatureMessageAtom = Atom(name: '_MainStore.temperatureMessage');

  @override
  String get temperatureMessage {
    _$temperatureMessageAtom.context
        .enforceReadPolicy(_$temperatureMessageAtom);
    _$temperatureMessageAtom.reportObserved();
    return super.temperatureMessage;
  }

  @override
  set temperatureMessage(String value) {
    _$temperatureMessageAtom.context.conditionallyRunInAction(() {
      super.temperatureMessage = value;
      _$temperatureMessageAtom.reportChanged();
    }, _$temperatureMessageAtom, name: '${_$temperatureMessageAtom.name}_set');
  }

  final _$humidityTopicAtom = Atom(name: '_MainStore.humidityTopic');

  @override
  String get humidityTopic {
    _$humidityTopicAtom.context.enforceReadPolicy(_$humidityTopicAtom);
    _$humidityTopicAtom.reportObserved();
    return super.humidityTopic;
  }

  @override
  set humidityTopic(String value) {
    _$humidityTopicAtom.context.conditionallyRunInAction(() {
      super.humidityTopic = value;
      _$humidityTopicAtom.reportChanged();
    }, _$humidityTopicAtom, name: '${_$humidityTopicAtom.name}_set');
  }

  final _$humidityMessageAtom = Atom(name: '_MainStore.humidityMessage');

  @override
  String get humidityMessage {
    _$humidityMessageAtom.context.enforceReadPolicy(_$humidityMessageAtom);
    _$humidityMessageAtom.reportObserved();
    return super.humidityMessage;
  }

  @override
  set humidityMessage(String value) {
    _$humidityMessageAtom.context.conditionallyRunInAction(() {
      super.humidityMessage = value;
      _$humidityMessageAtom.reportChanged();
    }, _$humidityMessageAtom, name: '${_$humidityMessageAtom.name}_set');
  }

  final _$groundTopicAtom = Atom(name: '_MainStore.groundTopic');

  @override
  String get groundTopic {
    _$groundTopicAtom.context.enforceReadPolicy(_$groundTopicAtom);
    _$groundTopicAtom.reportObserved();
    return super.groundTopic;
  }

  @override
  set groundTopic(String value) {
    _$groundTopicAtom.context.conditionallyRunInAction(() {
      super.groundTopic = value;
      _$groundTopicAtom.reportChanged();
    }, _$groundTopicAtom, name: '${_$groundTopicAtom.name}_set');
  }

  final _$groundMessageAtom = Atom(name: '_MainStore.groundMessage');

  @override
  String get groundMessage {
    _$groundMessageAtom.context.enforceReadPolicy(_$groundMessageAtom);
    _$groundMessageAtom.reportObserved();
    return super.groundMessage;
  }

  @override
  set groundMessage(String value) {
    _$groundMessageAtom.context.conditionallyRunInAction(() {
      super.groundMessage = value;
      _$groundMessageAtom.reportChanged();
    }, _$groundMessageAtom, name: '${_$groundMessageAtom.name}_set');
  }

  final _$sprinklerTopicAtom = Atom(name: '_MainStore.sprinklerTopic');

  @override
  String get sprinklerTopic {
    _$sprinklerTopicAtom.context.enforceReadPolicy(_$sprinklerTopicAtom);
    _$sprinklerTopicAtom.reportObserved();
    return super.sprinklerTopic;
  }

  @override
  set sprinklerTopic(String value) {
    _$sprinklerTopicAtom.context.conditionallyRunInAction(() {
      super.sprinklerTopic = value;
      _$sprinklerTopicAtom.reportChanged();
    }, _$sprinklerTopicAtom, name: '${_$sprinklerTopicAtom.name}_set');
  }

  final _$sprinklerMessageAtom = Atom(name: '_MainStore.sprinklerMessage');

  @override
  String get sprinklerMessage {
    _$sprinklerMessageAtom.context.enforceReadPolicy(_$sprinklerMessageAtom);
    _$sprinklerMessageAtom.reportObserved();
    return super.sprinklerMessage;
  }

  @override
  set sprinklerMessage(String value) {
    _$sprinklerMessageAtom.context.conditionallyRunInAction(() {
      super.sprinklerMessage = value;
      _$sprinklerMessageAtom.reportChanged();
    }, _$sprinklerMessageAtom, name: '${_$sprinklerMessageAtom.name}_set');
  }

  final _$dataAtom = Atom(name: '_MainStore.data');

  @override
  List get data {
    _$dataAtom.context.enforceReadPolicy(_$dataAtom);
    _$dataAtom.reportObserved();
    return super.data;
  }

  @override
  set data(List value) {
    _$dataAtom.context.conditionallyRunInAction(() {
      super.data = value;
      _$dataAtom.reportChanged();
    }, _$dataAtom, name: '${_$dataAtom.name}_set');
  }

  final _$connectAsyncAction = AsyncAction('connect');

  @override
  Future<dynamic> connect() {
    return _$connectAsyncAction.run(() => super.connect());
  }

  final _$getDataAsyncAction = AsyncAction('getData');

  @override
  Future<dynamic> getData({dynamic reload = false}) {
    return _$getDataAsyncAction.run(() => super.getData(reload: reload));
  }

  final _$_MainStoreActionController = ActionController(name: '_MainStore');

  @override
  void onOffWebsockets() {
    final _$actionInfo = _$_MainStoreActionController.startAction();
    try {
      return super.onOffWebsockets();
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPageChanged(int index) {
    final _$actionInfo = _$_MainStoreActionController.startAction();
    try {
      return super.onPageChanged(index);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTap(int index) {
    final _$actionInfo = _$_MainStoreActionController.startAction();
    try {
      return super.onTap(index);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void disconnect() {
    final _$actionInfo = _$_MainStoreActionController.startAction();
    try {
      return super.disconnect();
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void subscribe(String type, String newTopic) {
    final _$actionInfo = _$_MainStoreActionController.startAction();
    try {
      return super.subscribe(type, newTopic);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onMessage(List<MqttReceivedMessage> event) {
    final _$actionInfo = _$_MainStoreActionController.startAction();
    try {
      return super.onMessage(event);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }
}
