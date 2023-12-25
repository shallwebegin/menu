import 'package:flutter/material.dart';
import 'package:menu/models/meal.dart';
import 'package:menu/screen/meal_detail_screen.dart';

import 'package:menu/widgets/meal_item_trait.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      required this.meal,
      required this.title,
      required this.favoriMeali});
  final List<Meal> meal;
  final String title;
  final void Function(Meal meal) favoriMeali;
  void _selectedMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailScreen(
          meal: meal,
          favoriMeali: favoriMeali,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        children: [
          Text(
            'Oh no....',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Please select another',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
    );
    if (meal.isNotEmpty) {
      content = ListView.builder(
        itemCount: meal.length,
        itemBuilder: (context, index) => MealItemTrait(
          meal: meal[index],
          selectedMeal: (meal) => {_selectedMeal(context, meal)},
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
