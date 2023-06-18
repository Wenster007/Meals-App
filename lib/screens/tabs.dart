import 'package:flutter/material.dart';
import 'package:meals_app/screens/MealsScreen.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_screen_drawer.dart';

//for riverpod
import 'package:flutter_riverpod/flutter_riverpod.dart';

//providers
import 'package:meals_app/provider/meal_provider.dart';
import 'package:meals_app/provider/favorites_provider.dart';


const kInitialFilterValue = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedPageIndex = 0;
  Map<Filter, bool> _selectedFilters = kInitialFilterValue;

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  //for the Drawer ListTile functionality.
  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        (MaterialPageRoute(builder: (ctx) => FiltersScreen(currentFilters: _selectedFilters,))),
      );

      setState(() {
        _selectedFilters = result ?? kInitialFilterValue;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final meal = ref.watch(mealProvider);
    final availableMeal = meal.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();


    Widget activeScreen = CategoriesScreen(
      availableMeal: availableMeal,
    );

    var activePageTitle = "Categories";

    if (selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activeScreen = MealsScreen(
           meals: favoriteMeals);
      activePageTitle = "Favorites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MealScreenDrawer(onSelectScreen: _setScreen),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (ind) {
          _selectPage(ind);
        }, //this gets an input index by which the navigation is set.
        currentIndex:
            selectedPageIndex, //this is used to show which one is active.
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites"),
        ],
      ),
    );
  }
}
