import 'package:flutter/material.dart';
import 'package:food/model/meal.dart';
import 'package:food/widget/meal_item.dart';

class FavourieScreen extends StatelessWidget {

  final List<Meal> favourtieMeals;

  FavourieScreen(this.favourtieMeals);

  @override
  Widget build(BuildContext context) {
    if(favourtieMeals.isEmpty) {
      return Center(child:Text("You have not Favourite yet ... start add some"));

    }else {
      return ListView.builder(itemBuilder: (context, index) {
        return MealItem(
          id: favourtieMeals[index].id,
          title: favourtieMeals[index].title,
          imageUrl: favourtieMeals[index].imageUrl,
          affordability: favourtieMeals[index].affordability,
          complexity: favourtieMeals[index].complexity,
          duration: favourtieMeals[index].duration,

        );
      },
        itemCount:favourtieMeals.length ,
      );
    }
  }
}
