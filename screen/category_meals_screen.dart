import 'package:flutter/material.dart';
import 'package:food/dummy_data.dart';
import 'package:food/widget/meal_item.dart';
import 'package:food/model/meal.dart';

class Category_meals extends StatefulWidget {

  static const String id = "categories_meals";

  final List<Meal> avaliable_meals;
  Category_meals(this.avaliable_meals);

  @override
  _Category_mealsState createState() => _Category_mealsState();
}

class _Category_mealsState extends State<Category_meals> {

  String categorytitle;
  List<Meal> categoryMeals;
  var _loadedInitData = false;


  @override
  void initState() {

  //...

    super.initState();

  }

  @override
  void didChangeDependencies() {
    if(_loadedInitData == false) {
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
      print(ModalRoute.of(context).settings);
      categorytitle = routeArgs['categorytitle'];
      final categoryId = routeArgs['categoryId'];
      categoryMeals = widget.avaliable_meals.where((meal) => meal.categories.contains(categoryId)).toList();
      _loadedInitData = true;

    }


    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
      setState(() {
        categoryMeals.removeWhere((meal) => meal.id ==mealId);
      });
  }

  @override
  Widget build(BuildContext context) {

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
          removeItem: _removeMeal  ,
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