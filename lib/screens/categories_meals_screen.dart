import 'package:comidas_app/models/meals.dart';
import 'package:flutter/material.dart';
import '../components/meal_item.dart';
import '../models/category.dart';
import '../data/dummy_data.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meal;
  CategoriesMealsScreen(this.meal);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = meal.where((Meal) {
      return Meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 3,
        title: Text(category.title),
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (context, index) {
            return MealItem(categoryMeals[index]);
          }),
    );
  }
}
