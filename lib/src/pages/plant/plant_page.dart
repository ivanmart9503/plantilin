import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantilin/src/blocs/client_provider.dart';
import 'package:plantilin/src/pages/plant/dialog_topic.dart';
import 'package:provider/provider.dart';

class PlantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final ClientProvider client = Provider.of<ClientProvider>(context);

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: <Widget>[
          _selectPlant(width * 0.3, height * 0.3),
          SizedBox(
            height: 15.0,
          ),
          _dataTitle(),
          SizedBox(
            height: 20.0,
          ),
          _dataIcons(client, context),
        ],
      ),
    );
  }

  Widget _dataIcons(ClientProvider client, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () =>
              DialogTopic('Temperature', client).showTopicDialog(context),
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
                  '${client.temperature.values.join()}',
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
          onTap: () => DialogTopic('Humidity', client).showTopicDialog(context),
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
                  '${client.humidity.values.join()}',
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
          onTap: () => DialogTopic('Ground', client).showTopicDialog(context),
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
                  '${client.ground.values.join()}',
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
          onTap: () =>
              DialogTopic('Sprinkler', client).showTopicDialog(context),
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
                  '${client.sprinkler.values.join()}',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ],
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
