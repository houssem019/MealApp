
import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_meals';
  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categroytitle;
  late List<Meal> categoryMeals;

  @override
  void didChangeDependencies() {
    final routeArg = ModalRoute.of(context)!.settings.arguments as Map;
    final categoryid = routeArg['id'];
    categroytitle = routeArg['title'];
    categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryid);
    }).toList();
    super.didChangeDependencies();
  }
  // @override
  // void initState() {

  //   super.initState();
  // }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     categoryMeals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categroytitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            imageUrl: categoryMeals[index].imageUrl,
            title: categoryMeals[index].title,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
