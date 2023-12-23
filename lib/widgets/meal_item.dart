import 'package:flutter/material.dart';
import 'package:menu/models/meal.dart';
import 'package:menu/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Stack(
          children: [
            FadeInImage(
              fit: BoxFit.cover,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 200,
              width: double.infinity,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [MealItemTrait(icon: Icons.work, label: meal.id)],
            )
          ],
        ),
      ),
    );
  }
}
