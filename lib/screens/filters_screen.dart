import 'package:flutter/material.dart';

import 'package:meals_app/provider/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class FiltersScreen extends ConsumerWidget {

  const FiltersScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);

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


              value: activeFilters[Filter.glutenFree]!,
              onChanged: (isChecked) {
                ref.read(filterProvider.notifier).setFilter(Filter.glutenFree, isChecked);
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
            SwitchListTile(
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              value: activeFilters[Filter.lactoseFree]!,
              onChanged: (isChecked) {
                ref.read(filterProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
              },
              title: Text(
                "Lactose-Free",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only include lactose-free meals.",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
            SwitchListTile(
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              value: activeFilters[Filter.vegetarian]!,
              onChanged: (isChecked) {
                ref.read(filterProvider.notifier).setFilter(Filter.vegetarian, isChecked);
              },
              title: Text(
                "Vegetarian",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only include vegetarian meals.",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
            SwitchListTile(
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              value: activeFilters[Filter.vegan]!,
              onChanged: (isChecked) {
                ref.read(filterProvider.notifier).setFilter(Filter.vegan, isChecked);
              },
              title: Text(
                "Vegan",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only include vegan meals.",
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
