import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/Meal.dart';
import 'package:meals_app/model/category.dart';
import 'package:meals_app/screens/MealsScreen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {Key? key, required this.onFavoriteIcon, required this.availableMeal})
      : super(key: key);
  final void Function(Meal meal) onFavoriteIcon;
  final List<Meal> availableMeal;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeal
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
            title: category.title,
            meals: filteredMeals,
            onFavoriteIcon: onFavoriteIcon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        //alternative
        // availableCategories.map((category) => CategoryGridItem(category: category))
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
