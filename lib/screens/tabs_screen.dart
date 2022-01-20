import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favourite_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreen createState() => _TabsScreen();
}

class _TabsScreen extends State<TabsScreen> {
  late List _pages;
  int _selectPageindex = 0;
  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoriteScreen(widget.favoriteMeals), 'title': 'Favorites'},
    ];
    super.initState();
  }

  void _selectPage(int value) {
    setState(() {
      _selectPageindex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageindex]['title']),
      ),
      body: _pages[_selectPageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.white,
        currentIndex: _selectPageindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
