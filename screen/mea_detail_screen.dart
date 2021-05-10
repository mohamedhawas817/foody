import 'package:flutter/material.dart';
import 'package:food/dummy_data.dart';
import 'package:food/model/meal.dart';

class Meal_detailScreen extends StatelessWidget {

  static const String id_screen = "meal_detail";


  @override
  Widget build(BuildContext context) {

    final routes = ModalRoute.of(context).settings.arguments as Map<String, String>;
    String title = routes['title'];
    String id = routes['id'];
    String img = routes['imageUrl'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id );


    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              child: Image.network(selectedMeal.imageUrl, width: double.infinity, fit:BoxFit.cover ),
            ),
            Conti("Ingredients", Colors.blueAccent),
            Conbor(selectedMeal, ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.cyanAccent,
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                );
              },
              itemCount: selectedMeal.ingredients.length ,
            ),),
            Conti("Steps", Colors.black87),
            Conbor(selectedMeal, ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(child: Text('# ${index + 1}'),),
                    title: Text(selectedMeal.steps[index]),
                  );
                },
              itemCount: selectedMeal.steps.length,
            ))
          ],
        ),
      )
    );

  }
}

class Conbor extends StatelessWidget {

  final Meal selectedMeal;
  Widget child;
  Conbor(this.selectedMeal, this.child);




  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration( borderRadius: BorderRadius.circular(15), color: Colors.white70, border: Border.all(color: Colors.grey)),
      width: 300,
      height: 200,
      child: child
    );
  }
}

class Conti extends StatelessWidget {

  String title;
  Color color;
  Conti(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: TextStyle(fontSize: 17, color:color),),
    );
  }
}
