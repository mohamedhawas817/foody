import 'package:flutter/material.dart';
import 'package:food/screen/categories_screen.dart';
import 'package:food/screen/favouriteScreen.dart';
import 'package:food/widget/main_drawer.dart';
import 'package:food/model/meal.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favourtieMeals;
  TabsScreen(this.favourtieMeals);



  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

   List<Map<String, Object>> _pages;

  int _selectPageIndex = 0;

  @override
  void initState() {

    _pages =  [
      {'page' :CategoriesScreen(), 'title': "Categories"},
      {'page': FavourieScreen(widget.favourtieMeals), 'title': 'Favorite'}
    ];

    super.initState();
  }

  void _selectPage(int index) {
      setState(() {
        _selectPageIndex = index;
      });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title'],),
      ),
      drawer: Drawer(child: MainDrawer(),),

      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap:_selectPage ,
          unselectedItemColor: Colors.white70,
          selectedItemColor: Theme.of(context).accentColor,
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: _selectPageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(backgroundColor: Theme.of(context).primaryColor, icon: Icon(Icons.category), title: Text("Categories") ),
            BottomNavigationBarItem(backgroundColor: Theme.of(context).primaryColor, icon: Icon(Icons.star), title: Text("Favorites") )
          ]
      ),
    ));

  }
}


// return DefaultTabController(length: 2, child: Scaffold(
// appBar: AppBar(title: Text("Meals"), bottom: TabBar(tabs: [
// Tab(icon: Icon(Icons.category) , text: "Categories", ),
// Tab(icon: Icon(Icons.star), text: "Star" ,)
// ],
// ),
//
// ),
// body: TabBarView(children: [
// CategoriesScreen(),
// FavourieScreen(),
// ],),
// ));