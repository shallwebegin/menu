import 'package:flutter/material.dart';
import 'package:menu/models/meal.dart';
import 'package:menu/screens/categories.dart';
import 'package:menu/screens/meals.dart';
import 'package:menu/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  final List<Meal> favoriteMeals = [];
  void _favoritePage(Meal meal) {
    final isExisting = favoriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        favoriteMeals.remove(meal);
        Navigator.pop(context);
      });
      _showInfoMessage('Favorilerden Cikarildi');
    } else {
      setState(() {
        favoriteMeals.add(meal);
        Navigator.pop(context);
        _showInfoMessage('Favorilere eklendi');
      });
    }
  }

  int pageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  void _setPage(String identifier) {
    if (identifier == 'Filters') {
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      favoriteScreen: _favoritePage,
    );
    var activePageTitle = 'Categories';
    if (pageIndex == 1) {
      activePage = MealsScreen(
        meals: favoriteMeals,
        favoriteScreen: _favoritePage,
      );
      activePageTitle = 'Favorite';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setPage),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.amber,
        currentIndex: pageIndex,
        onTap: (index) {
          _selectPage(index);
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
