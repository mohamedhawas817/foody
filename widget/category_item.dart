import 'package:flutter/material.dart';
import 'file:///C:/Users/M%20E%20T%20R%20O/flutter/food/lib/screen/category_meals_screen.dart';
import 'file:///C:/Users/M%20E%20T%20R%20O/flutter/food/lib/screen/categories_screen.dart';


class CategoryItem extends StatelessWidget {

  static const String id_route = "category_item";

  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);


  // void push(context) {
  //
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => ))
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () =>Navigator.pushNamed(context, Category_meals.id , arguments: {'categoryId': id, 'categorytitle': title}),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.headline6,),

        decoration: BoxDecoration(

        gradient: LinearGradient(
        colors: [color.withOpacity(0.7), color],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        ),


        borderRadius: BorderRadius.circular(15)
        ),



      ),
    );
  }
}


// decoration: BoxDecoration(
//
// gradient: LinearGradient(
// colors: [color.withOpacity(0.7), color],
// begin: Alignment.topLeft,
// end: Alignment.bottomRight,
// ),
//
//
// borderRadius: BorderRadius.circular(15)
// ),