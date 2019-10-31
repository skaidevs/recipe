import 'package:flutter/material.dart';
import 'package:recipe/dummy_data.dart';
import 'package:recipe/models/recipe.dart';
import 'package:recipe/screens/categories_screen.dart';
import 'package:recipe/screens/category_recipe_screen.dart';
import 'package:recipe/screens/recipe_detail_screen.dart';
import 'package:recipe/screens/settings_screen.dart';
import 'package:recipe/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Recipe> _availableRecipes = DUMMY_DATA;
  List<Recipe> _favoriteRecipe = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableRecipes = DUMMY_DATA.where((recipe) {
        if (_filters['gluten'] && !recipe.isGlutenFree) {
          return false;
        }

        if (_filters['lactose'] && !recipe.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !recipe.isVegan) {
          return false;
        }

        if (_filters['vegetarian'] && !recipe.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String recipeId) {
    final existingIndex =
        _favoriteRecipe.indexWhere((recipe) => recipe.id == recipeId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteRecipe.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteRecipe.add(
          DUMMY_DATA.firstWhere((recipe) => recipe.id == recipeId),
        );
      });
    }
  }

  bool _isRecipeFavorite(String id) {
    return _favoriteRecipe.any((recipe) => recipe.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Color.fromRGBO(255, 254, 229, 1),
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
          '/': (context) => TabsScreen(_favoriteRecipe),
          CategoryRecipeScreen.routeName: (context) =>
              CategoryRecipeScreen(_availableRecipes),
          RecipeDetailScreen.routeName: (context) =>
              RecipeDetailScreen(_toggleFavorite, _isRecipeFavorite),
          SettingsScreen.routeName: (context) =>
              SettingsScreen(_filters, _setFilters),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => CategoriesScreen(),
          );
        });
  }
}
