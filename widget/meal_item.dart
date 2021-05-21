import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/model/meal.dart';
import 'package:food/screen/mea_detail_screen.dart';

class MealItem extends StatelessWidget {

  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;


  MealItem({this.id, this.title, this.imageUrl, this.duration, this.complexity, this.affordability, this.removeItem});





  String get complex {
    switch(complexity) {
      case Complexity.Simple:
        return "Sample";
        break;

      case Complexity.Challenging:
        return "Challenging";
        break;

      case Complexity.Hard:
        return "Hard";
        break;

      default:
        "Unknown";


    }
  }

  String get afford {
    switch(affordability) {
      case Affordability.Affordable: return "Affordable"; break;
      case Affordability.Luxurious: return "Luxurious"; break;
      case Affordability.Pricey: return "Pricey"; break;
      default:
        "Unknown";
    }
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: () => Navigator.pushNamed(
          context,
          Meal_detailScreen.id_screen,
          arguments: { 'imageUrl' :imageUrl, 'id': id, 'title': title}
          )
        .then((value) {
          if(value != null) {
            removeItem(value);
          }
      }),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(

                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15) ,
                      topLeft: Radius.circular(15)
                    ),
                    child: Image.network(imageUrl, height: 250, width: double.infinity, fit: BoxFit.cover, ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Text(title, style: TextStyle(
                        fontSize: 20,
                        color: Colors.white70,

                      ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),


                ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 Row(
                   children: [
                     Icon(Icons.schedule),
                     SizedBox(width: 6,),
                     Text("$duration min")
                   ],
                 ),

                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6,),
                      Text(complex)
                    ],

                  ),
                 Text(afford)

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
