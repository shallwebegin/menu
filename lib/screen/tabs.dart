import 'package:flutter/material.dart';
import 'package:menu/models/meal.dart';
import 'package:menu/screen/categories.dart';
import 'package:menu/screen/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> favoriteMeal = [];
  void _onToggleFavoriteMeal(Meal meal) {
    final isExisting = favoriteMeal.contains(meal);
    if (isExisting) {
      setState(() {
        favoriteMeal.remove(meal);
      });
    } else {
      setState(() {
        favoriteMeal.add(meal);
      });
    }
  }

  int favoritePageIndex = 0;
  void _pageIndex(int index) {
    setState(() {
      favoritePageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      favoriMeali: _onToggleFavoriteMeal,
    );
    var activePageTitle = 'Categories';
    if (favoritePageIndex == 1) {
      activePage = MealsScreen(
        meal: favoriteMeal,
        title: 'Favorite',
        favoriMeali: _onToggleFavoriteMeal,
      );
      activePageTitle = 'Your Favorite';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _pageIndex(index);
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite'),
        ],
      ),
    );
  }
}
