import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        )
      ],
    );
  }
}
