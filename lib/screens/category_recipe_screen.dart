import 'package:flutter/material.dart';
import 'package:recipe/dummy_data.dart';
import 'package:recipe/widgets/recipe_item.dart';

class CategoryRecipeScreen extends StatelessWidget {
  static const routeName = 'category_recipe';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    //HERE we go
    final categoryRecipe =
        DUMMY_DATA.where((r) => r.categories.contains(categoryId)).toList();

    print(categoryTitle);
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: categoryRecipe.length,
        itemBuilder: (context, index) {
          return RecipeItem(
              id: categoryRecipe[index].id,
              title: categoryRecipe[index].title,
              imageUrl: categoryRecipe[index].imageUrl,
              duration: categoryRecipe[index].duration,
              complexity: categoryRecipe[index].complexity,
              affordability: categoryRecipe[index].affordability);
        },
      ),
    );
  }
}
