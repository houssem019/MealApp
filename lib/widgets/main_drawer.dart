import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_meals_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListtile(String title, IconData icon, Function()? tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(title,
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.w700,
          )),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          //margin: EdgeInsets.all(10),
          color: Colors.white70,
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          child: Text(
            "Cooking Up!",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        buildListtile("Meal", Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListtile("Filters", Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
        }),
      ],
    ));
  }
}
