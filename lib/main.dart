import 'package:flutter/material.dart';
import 'package:recipe/categories_screen.dart';
import 'package:recipe/category_recipe_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'RobotoCondensed'),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => CategoriesScreen(),
        CategoryRecipeScreen.routeName: (context) => CategoryRecipeScreen()
      },
    );
  }
}
