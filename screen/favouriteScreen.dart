import 'package:flutter/material.dart';
import 'package:food/model/meal.dart';


class FavourieScreen extends StatelessWidget {

  final List<Meal> favourtieMeals;

  FavourieScreen(this.favourtieMeals);

  @override
  Widget build(BuildContext context) {
    return Center(child:Text("You have not Favourite yet ... start add some"));
  }
}
