import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),

      //Code for drawer which we removed.
      // drawer: MealScreenDrawer(onSelectScreen: (identifier) {
      //   if (identifier == "meals") {
      //     Navigator.of(context).pop();
      //     Navigator.of(context).pushReplacement(
      //         (MaterialPageRoute(builder: (ctx) => const TabsScreen())));
      //   } else {
      //     Navigator.of(context).pop();
      //   }
      // }),



      body: Column(
        children: [
          SwitchListTile(
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            value: _glutenFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _glutenFreeFilterSet = isChecked;
              });
            },
            title: Text(
              "Gluten-Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Only include gluten-free meals.",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
        ],
      ),
    );
  }
}
