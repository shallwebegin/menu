import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onFilterSelect});
  final void Function(String identifier) onFilterSelect;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  color: Theme.of(context).colorScheme.primary,
                  size: 48,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  'Cooking Up',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: Text(
              'Meals',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {
              onFilterSelect('Meals');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              'Filters',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {
              onFilterSelect('Filters');
            },
          ),
        ],
      ),
    );
  }
}
