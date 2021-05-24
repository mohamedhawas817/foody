import 'package:flutter/material.dart';
import 'file:///C:/Users/M%20E%20T%20R%20O/flutter/food/lib/screen/categories_screen.dart';
import 'file:///C:/Users/M%20E%20T%20R%20O/flutter/food/lib/screen/category_meals_screen.dart';
import 'package:food/screen/mea_detail_screen.dart';
import 'package:food/screen/tabs.dart';
import 'package:food/screen/filter_screen.dart';
import 'package:food/dummy_data.dart';
import 'package:food/model/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters= {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegaterian": false,
  };

  List<Meal> _avaliableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {

    setState(() {
      _filters = filterData;

      _avaliableMeals = DUMMY_MEALS.where((meal)  {
        if(_filters["gluten"] && !meal.isGlutenFree) {
          return false;
        }

        if(_filters["lactose"] && !meal.isLactoseFree) {
          return false;
        }

        if(_filters["vegan"] && !meal.isVegan) {
          return false;
        }

        if(_filters["vegaterian"] && !meal.isVegetarian) {
          return false;
        }
        return true;



      }).toList();
    });

  }

  void _toggleFavourite(String mealId) {
      final existingIndex =  _favouriteMeals.indexWhere((meal) => meal.id == mealId);
      if(existingIndex >=0) {
        setState(() {
          _favouriteMeals.removeAt(existingIndex);
        });
      }else {
        setState(() {
          _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));

        });
      }
  }

  bool _isMealFavourtie(String Id) {
    return _favouriteMeals.any((meal) => meal.id == Id); //any stops after first element it found
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliMeals",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1),),
          bodyText2:  TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          headline6: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondenSed',
            fontWeight: FontWeight.bold,
          )
        )
      ),
      initialRoute: CategoriesScreen.id,
      routes: {
        CategoriesScreen.id : (context) => TabsScreen(_favouriteMeals),
        Category_meals.id : (context) => Category_meals(_avaliableMeals),
        Meal_detailScreen.id_screen: (context)  => Meal_detailScreen(_toggleFavourite, _isMealFavourtie),
        FilterScreen.id: (context) => FilterScreen(_filters, _setFilters)

      },


      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   if( settings.name ==CategoriesScreen.id ) {
      //     return ...
      //   }else if (settings.name == "something else") {
      //     return ...
      //   }
      //   return MaterialPageRoute(builder: (context) =>CategoriesScreen() );
      // },
      // onUnknownRoute: (settings) {
      //   //when flutter fail to load screen
      //   return MaterialPageRoute(builder: (context) =>CategoriesScreen() );
      // },
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("DeliMeals"),
      ),
      body: Container(child: Text("Yo"),),
    );
  }
}
