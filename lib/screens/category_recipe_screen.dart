import 'package:flutter/material.dart';
import 'package:recipe/dummy_data.dart';
import 'package:recipe/models/recipe.dart';
import 'package:recipe/widgets/recipe_item.dart';

class CategoryRecipeScreen extends StatefulWidget {
  static const routeName = 'category_recipe';
  final List<Recipe> availableRecipes;

  CategoryRecipeScreen(this.availableRecipes);

  @override
  _CategoryRecipeScreenState createState() => _CategoryRecipeScreenState();
}

class _CategoryRecipeScreenState extends State<CategoryRecipeScreen> {
  String categoryTitle;
  List<Recipe> displayedRecipe;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];

      //HERE we go
      displayedRecipe = widget.availableRecipes
          .where(
            (r) => r.categories.contains(categoryId),
          )
          .toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeRecipe(String recipeId) {
    setState(() {
      displayedRecipe.removeWhere((recipe) => recipe.id == recipeId);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(categoryTitle);
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: displayedRecipe.length,
        itemBuilder: (context, index) {
          return RecipeItem(
            id: displayedRecipe[index].id,
            title: displayedRecipe[index].title,
            imageUrl: displayedRecipe[index].imageUrl,
            duration: displayedRecipe[index].duration,
            complexity: displayedRecipe[index].complexity,
            affordability: displayedRecipe[index].affordability,
          );
        },
      ),
    );
  }
}
