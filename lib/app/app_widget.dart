import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shopping_list/app/modules/home/home_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQueryData.fromWindow(window).size.height;
    return MaterialApp(
      title: 'Shopping Lists',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: TextTheme(
          subtitle: TextStyle(
            fontSize: height * .023,
            color: Colors.grey,
            fontWeight: FontWeight.normal,
          ),
          title: TextStyle(
            fontSize: height * .027,
            fontWeight: FontWeight.normal,
          ),
          subhead: TextStyle(
            fontSize: height * .022,
            color: Colors.grey,
          ),
        ),
      ),
      home: HomeModule(),
    );
  }
}
