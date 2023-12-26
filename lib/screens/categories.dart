import 'package:flutter/material.dart';
import 'package:menu/data/dummy_data.dart';
import 'package:menu/models/category.dart';
import 'package:menu/models/meal.dart';
import 'package:menu/screens/meals.dart';
import 'package:menu/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.favoriteScreen});
  final void Function(Meal meal) favoriteScreen;
  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealsScreen(
        title: category.title,
        meals: filteredMeals,
        favoriteScreen: favoriteScreen,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            selectCategory: () {
              _selectedCategory(context, category);
            },
          )
      ],
    );
  }
}
