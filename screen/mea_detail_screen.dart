import 'package:flutter/material.dart';


class Meal_detailScreen extends StatelessWidget {

  static const String id_screen = "meal_detail";


  @override
  Widget build(BuildContext context) {

    final routes = ModalRoute.of(context).settings.arguments as Map<String, String>;
    String title = routes['title'];

    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Center(child: Text("This is details"),),
    );

  }
}
