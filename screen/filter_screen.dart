import 'package:flutter/material.dart';
import 'package:food/widget/main_drawer.dart';


class FilterScreen extends StatefulWidget {

  static const String id = "filterScreen";
  final Function saveFilter;
  final Map<String, bool> currentFilters;


  FilterScreen(this.currentFilters, this.saveFilter);




  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  bool _glutenfree = false;
  bool _vegetarien = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {

    _glutenfree = widget.currentFilters["gluten"];
    _vegetarien = widget.currentFilters["vegaterian"];
    _vegan = widget.currentFilters["vegan"];
    _lactoseFree = widget.currentFilters["lactose"];


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar( 
          title: Text("filter")
          ,centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: () {
            final selectedFilter = {
              "gluten": _glutenfree,
              "lactose": _lactoseFree,
              "vegan": _vegan,
              "vegaterian": _vegetarien,
            };
            widget.saveFilter(selectedFilter);
          })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust Your meal Selection", style: TextStyle(fontWeight: FontWeight.w900),),
          ),
          Expanded(
            child: ListView(children: [
              ListswitchTile("Gluten-Free", "Only include gluten-Free meals", _glutenfree, (e) {
                setState(() {
                  _glutenfree = e;
                });
              }),
              ListswitchTile("Vegetarien-Free", "Only include Vegetarien-Free meals", _vegetarien, (e) {
                setState(() {
                  _vegetarien = e;
                });
              }),
              ListswitchTile("Vegan-Free", "Only include Vegan-Free meals", _vegan, (e) {
                setState(() {
                  _vegan = e;
                });
              }),
              ListswitchTile("Lactose-Free", "Only include Lactose-Free meals", _lactoseFree, (e) {
                setState(() {
                  _lactoseFree = e;
                });
              }),
            ],),
          )
        ],
      )
    );
  }

  SwitchListTile ListswitchTile(String title, String subtitle, bool glu, Function chnaged ) {
    return SwitchListTile(title: Text(title), subtitle: Text(subtitle)  ,value: glu, onChanged: chnaged,);
  }
}
