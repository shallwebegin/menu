import 'package:flutter/material.dart';
import 'package:menu/models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Stack(),
      ),
    );
  }
}
