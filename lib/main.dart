import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'controllers/action_controller.dart';

import 'screens/home_scree.dart';

void main() => runApp(CircleAction());

class CircleAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: "Circle Action",
      home: HomeScreen(),
    );
  }
}
