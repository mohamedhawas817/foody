import 'package:flutter/material.dart';
import 'file:///C:/Users/M%20E%20T%20R%20O/flutter/food/lib/screen/categories_screen.dart';
import 'file:///C:/Users/M%20E%20T%20R%20O/flutter/food/lib/screen/category_meals_screen.dart';
import 'package:food/screen/mea_detail_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        CategoriesScreen.id : (context) => CategoriesScreen(),
        Category_meals.id : (context) => Category_meals(),
        Meal_detailScreen.id_screen: (context)  => Meal_detailScreen()

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
