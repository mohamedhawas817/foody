import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/dummy_data.dart';
import 'file:///C:/Users/M%20E%20T%20R%20O/flutter/food/lib/widget/category_item.dart';




class CategoriesScreen extends StatelessWidget {

  static const String id = "categories_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:  AppBar(
      //   title: Text("DeliMeals"),
      // ),
      body: GridView(
        padding: EdgeInsets.all(25),
          children: DUMMY_CATEGORIES.map((e) => CategoryItem(e.id, e.title, e.color)).toList() ,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio:  3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20
          )
      ),
    );
  }
}
