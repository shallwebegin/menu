import 'package:flutter/material.dart';
import 'package:menu/data/dummy_data.dart';
import 'package:menu/models/meal.dart';
import 'package:menu/screens/categories.dart';
import 'package:menu/screens/filters.dart';
import 'package:menu/screens/meals.dart';
import 'package:menu/widgets/main_drawer.dart';

const kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  Map<Filter, bool> _selectedFilters = kInitialFilter;
  final List<Meal> favoriteMeals = [];
  int _pageIndex = 0;
  void _selectPageIndex(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  void _selectFavoriteMeal(Meal meal) {
    final isExisting = favoriteMeals.contains(meal);
    Navigator.of(context).pop();
    if (isExisting) {
      setState(() {
        favoriteMeals.remove(meal);
      });
    } else {
      setState(() {
        favoriteMeals.add(meal);
      });
    }
  }

  void onFilterSelect(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => const FiltersScreen(),
        ),
      );
      setState(() {
        _selectedFilters = result ?? kInitialFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final avaibleMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(
      avaibleMeals: avaibleMeals,
      onFavoriteSelect: _selectFavoriteMeal,
    );
    var activePageTitle = 'Categories';
    if (_pageIndex == 1) {
      activePage = MealsScreen(
        meals: favoriteMeals,
        onFavoriteSelect: _selectFavoriteMeal,
      );
      activePageTitle = 'Favorite';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      drawer: MainDrawer(onFilterSelect: onFilterSelect),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPageIndex,
        currentIndex: _pageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite'),
        ],
      ),
    );
  }
}
