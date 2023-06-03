import 'package:flutter/material.dart';
import 'package:meals_app/model/Meal.dart';
import 'package:meals_app/screens/MealsScreen.dart';
import 'package:meals_app/screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  //for showing some text once the favorite button is clicked.
  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _onSelectFavourite(Meal meal) {
    if (_favoriteMeals.contains(meal)) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInfoMessage("Meal removed from Favorites");
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showInfoMessage("Meal added to Favorites");
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen(
      onFavoriteIcon: _onSelectFavourite,
    );
    var activePageTitle = "Categories";

    if (selectedPageIndex == 1) {
      activeScreen = MealsScreen(
          onFavoriteIcon: _onSelectFavourite, meals: _favoriteMeals);
      activePageTitle = "Favorites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap:
            _selectPage, //this gets an input index by which the navigation is set.
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
