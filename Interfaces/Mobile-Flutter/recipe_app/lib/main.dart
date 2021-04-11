import 'package:flutter/material.dart';
import 'package:recipe_app/views/favorite-page.dart';
import 'package:recipe_app/views/create-recipe-page.dart';
import 'package:recipe_app/views/home-page.dart';
import 'package:recipe_app/views/login-page.dart';
import 'package:recipe_app/views/recipe-page.dart';
import 'package:recipe_app/views/register-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: LoginPage(),
      routes: {
        "login": (context)=>LoginPage(),
        "register": (context)=>RegisterPage(),
        "home": (context)=>HomePage(),
        "create_recipe": (context)=>CreateRecipePage(),
        "view_recipe": (context)=>RecipePage(),
        "favorites": (context)=>FavoriteRecipesPage(),
      },
    );
  }
}