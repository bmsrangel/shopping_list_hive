import 'package:flutter/material.dart';
import 'package:shopping_list/app/modules/home/home_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Lists',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomeModule(),
    );
  }
}
