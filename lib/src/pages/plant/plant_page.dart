import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:plantilin/src/pages/plant/dialog_topic.dart';
import 'package:plantilin/src/stores/main_store.dart';

class PlantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final store = Provider.of<MainStore>(context);

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: store.isConnected
          ? ListView(
              children: <Widget>[
                _selectPlant(width * 0.3, height * 0.3),
                SizedBox(
                  height: 15.0,
                ),
                _dataTitle(),
                SizedBox(
                  height: 20.0,
                ),
                _dataIcons(store, context),
              ],
            )
          : Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Conéctate para ver los datos de tu planta\n',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '¡En tiempo real!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Widget _dataIcons(MainStore store, BuildContext context) {
    return Observer(
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () => DialogTopic('temperature').showTopicDialog(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: SvgPicture.asset(
                    'assets/temperature.svg',
                    width: 40,
                    height: 40,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Temperatura:',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    store.temperatureMessage,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () => DialogTopic('humidity').showTopicDialog(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: SvgPicture.asset(
                    'assets/humidity.svg',
                    width: 40,
                    height: 40,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Húmedad:',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    store.humidityMessage,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () => DialogTopic('ground').showTopicDialog(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: SvgPicture.asset(
                    'assets/ground.svg',
                    width: 40,
                    height: 40,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'H. Tierra:',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    store.groundMessage,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () => DialogTopic('sprinkler').showTopicDialog(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: SvgPicture.asset(
                    'assets/sprinkler.svg',
                    width: 40,
                    height: 40,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Aspersores:',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    store.sprinklerMessage,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dataTitle() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Datos de la planta',
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Overpass',
          fontSize: 18.0,
        ),
        children: <TextSpan>[
          TextSpan(
            text: ' en tiempo real',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.green,
              fontFamily: 'Overpass',
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _selectPlant(double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          'assets/leaf.svg',
          width: width,
          height: height,
        ),
      ],
    );
  }
}
