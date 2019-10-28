import 'package:flutter/material.dart';
import 'package:recipe/dummy_data.dart';

class CategoryRecipeScreen extends StatelessWidget {
  static const routeName = 'category';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    //HERE we go
    final category =
        DUMMY_DATA.where((r) => r.categories.contains(categoryId)).toList();

    print(categoryTitle);
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: category.length,
        itemBuilder: (context, index) {
          return Text(category[index].title);
        },
      ),
    );
  }
}
