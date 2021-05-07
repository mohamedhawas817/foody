import 'package:flutter/material.dart';
import 'package:food/dummy_data.dart';
import 'package:food/widget/meal_item.dart';

class Category_meals extends StatelessWidget {

  static const String id = "categories_meals";

  // String categorytitle;
  // String categoryId;
  //
  // Category_meals({this.categorytitle, this.categoryId});


  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    print(ModalRoute.of(context).settings);
    final categorytitle = routeArgs['categorytitle'];
    final categoryId = routeArgs['categoryId'];
    final categoryMeals = DUMMY_MEALS.where((meal) => meal.categories.contains(categoryId)).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categorytitle)),
      body: ListView.builder(itemBuilder: (context, index) {
        return MealItem(
          id: categoryMeals[index].id,
          title: categoryMeals[index].title,
          imageUrl: categoryMeals[index].imageUrl,
          affordability: categoryMeals[index].affordability,
          complexity: categoryMeals[index].complexity,
          duration: categoryMeals[index].duration,
        );
      },
        itemCount:categoryMeals.length ,
      ),
    );
  }
}


// MealItem(
// title: categoryMeals[index].title,
// imageUrl: categoryMeals[index].imageUrl,
// affordability: categoryMeals[index].affordability,
// complexity: categoryMeals[index].complexity,
// duration: categoryMeals[index].duration,
// );