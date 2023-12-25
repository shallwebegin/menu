import 'package:flutter/material.dart';
import 'package:menu/models/meal.dart';
import 'package:menu/widgets/meal_item_detail.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait(
      {super.key, required this.meal, required this.selectMeal});
  final Meal meal;
  final void Function(Meal meal) selectMeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          selectMeal(meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemDetail(
                            icon: Icons.schedule,
                            title: '${meal.duration} min'),
                        MealItemDetail(icon: Icons.work, title: complexityText),
                        MealItemDetail(
                            icon: Icons.attach_money, title: affordabilityText),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
