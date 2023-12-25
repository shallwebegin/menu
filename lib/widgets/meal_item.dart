import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.label, required this.icon});
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 8,
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
