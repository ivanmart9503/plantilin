import 'package:flutter/material.dart';

class GlobalTitle extends StatelessWidget {
  final String plantName;

  GlobalTitle(this.plantName);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Plantilín ',
        style: TextStyle(
          fontSize: plantName != '' ? 18 : 24,
          color: plantName != '' ? Colors.green : Colors.black,
          fontFamily: 'Overpass',
        ),
        children: <TextSpan>[
          plantName != ''
              ? TextSpan(
                  text: plantName,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Overpass',
                  ),
                )
              : TextSpan(text: ''),
        ],
      ),
    );
  }
}
