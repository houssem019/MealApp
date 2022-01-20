import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal_detail';
  final Function toggleFavorites;
  final Function isMealFavourite;

  MealDetailScreen(this.toggleFavorites, this.isMealFavourite);

  Widget buildSelectedText(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildcontainer(Widget child) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.pink),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSelectedText(context, "Ingredients"),
            buildcontainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.cyanAccent.withOpacity(0.5),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text("* ${selectedMeal.ingredients[index]}"),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSelectedText(context, "Steps"),
            buildcontainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      selectedTileColor: Colors.white70,
                      leading: CircleAvatar(
                        child: Text("${index + 1}"),
                      ),
                      title: Text("${selectedMeal.steps[index]}"),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorites(mealId),
        child: Icon(
          isMealFavourite(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
