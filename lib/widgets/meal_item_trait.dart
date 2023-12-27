import 'package:flutter/material.dart';
import 'package:menu/models/meal.dart';
import 'package:menu/widgets/meal_item.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait(
      {super.key, required this.meal, required this.selectedMeal});
  final Meal meal;
  final void Function(Meal meal) selectedMeal;

  String get complexityText {
    return meal.complexity.name[0] + meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0] + meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
          onTap: () {
            selectedMeal(meal);
          },
          child: Stack(
            children: [
              Hero(
                tag: meal.id,
                child: FadeInImage(
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                ),
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
                          MealItem(
                              icon: Icons.schedule,
                              label: '${meal.duration} min'),
                          MealItem(icon: Icons.work, label: complexityText),
                          MealItem(
                              icon: Icons.attach_money,
                              label: affordabilityText)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
