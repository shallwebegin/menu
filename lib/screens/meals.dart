import 'package:flutter/material.dart';
import 'package:menu/models/meal.dart';
import 'package:menu/screens/meal_detail.dart';
import 'package:menu/widgets/meal_item_trait.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals, this.title});
  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealDetailScreen(meal: meal),
    ));
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
            height: 16,
          ),
          const Text('Pick another cateory'),
        ],
      ),
    );

    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItemTrait(
            meal: meals[index],
            selectMeal: (meal) {
              selectMeal(context, meal);
            }),
      ),
    );
  }
}
