import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipe_app/data_models/User.dart';
import 'package:recipe_app/views/favorite-page.dart';
import 'package:recipe_app/views/create-recipe-page.dart';
import 'package:recipe_app/views/home-page.dart';
import 'package:recipe_app/views/login-page.dart';
import 'package:recipe_app/views/recipe-page.dart';
import 'package:recipe_app/views/register-page.dart';
import 'package:recipe_app/views/splash-page.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
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
      home: HomePage(),
      routes: {
        "splash": (context)=>SplashPage(),
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