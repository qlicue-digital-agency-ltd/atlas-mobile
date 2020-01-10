import 'package:flutter/material.dart';

class TechnicianTile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(Icons.camera_alt),
        SizedBox(width: 10.0,),
        Text('Camera')
      ],
    );
  }

}