import 'package:flutter/material.dart';
import 'package:recipe/models/recipe.dart';
import 'package:recipe/widgets/recipe_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Recipe> favoriteRecipe;

  FavoritesScreen(this.favoriteRecipe);

  @override
  Widget build(BuildContext context) {
    if (favoriteRecipe.isEmpty) {
      return Container(
        child: Text('You have no favorites yet!'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteRecipe.length,
        itemBuilder: (context, index) {
          return RecipeItem(
            id: favoriteRecipe[index].id,
            title: favoriteRecipe[index].title,
            imageUrl: favoriteRecipe[index].imageUrl,
            duration: favoriteRecipe[index].duration,
            complexity: favoriteRecipe[index].complexity,
            affordability: favoriteRecipe[index].affordability,
          );
        },
      );
    }
  }
}
