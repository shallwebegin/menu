import 'package:flutter/material.dart';
import 'package:menu/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen(
      {super.key, required this.meal, required this.favoriteMealCheck});
  final Meal meal;

  final void Function(Meal meal) favoriteMealCheck;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              favoriteMealCheck(meal);
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 20,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Steps',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 20,
            ),
            for (final step in meal.steps)
              Text(
                step,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              )
          ],
        ),
      ),
    );
  }
}
