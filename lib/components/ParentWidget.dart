import 'package:flutter/material.dart';

import 'TapBoxB.dart';

class ParentWidget extends StatefulWidget {
  @override
  ParentWidgetState createState() => new ParentWidgetState();
}

class ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child:  TapBoxB(
        isActive: _active,
        onChanged: _handleTapBoxChanged,
      )
    );
  }
}