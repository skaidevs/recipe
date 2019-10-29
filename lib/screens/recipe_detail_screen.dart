import 'package:flutter/material.dart';
import 'package:recipe/dummy_data.dart';

class RecipeDetailScreen extends StatelessWidget {
  static const routeName = 'recipe_detail';

  Widget buildSectionTitle(String title, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      height: 170.0,
      width: 350.0,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final recipeId = ModalRoute.of(context).settings.arguments as String;
    final selectedRecipe =
        DUMMY_DATA.firstWhere((recipe) => recipe.id == recipeId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedRecipe.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300.0,
              width: double.infinity,
              child: Image.network(
                selectedRecipe.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients', context),
            buildContainer(
              ListView.builder(
                itemCount: selectedRecipe.ingredients.length,
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    child: Text(selectedRecipe.ingredients[index]),
                  ),
                ),
              ),
            ),
            buildSectionTitle('Steps', context),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(selectedRecipe.steps[index]),
                    ),
                    Divider(
                      endIndent: 25.0,
                      indent: 65.0,
                      thickness: 2.0,
                    ),
                  ],
                ),
                itemCount: selectedRecipe.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
