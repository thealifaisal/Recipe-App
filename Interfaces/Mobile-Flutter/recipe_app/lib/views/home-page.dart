import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/components/AppBar.dart';
import 'package:recipe_app/components/RecipeCard.dart';
import 'package:recipe_app/app-config.dart';
import 'package:recipe_app/components/SideDrawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double screenHeight;
  double screenWidth;
  Color pinkTheme;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  double screenLeftPad = RecipeAppTheme.screenLeftPad;
  double screenRightPad = RecipeAppTheme.screenRightPad;
  double screenTopPad = RecipeAppTheme.screenTopPad;
  double screenBottomPad = RecipeAppTheme.screenBottomPad;

  @override
  void initState() {

    pinkTheme = RecipeAppTheme.pinkTheme;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
      appBar: RecipeAppBar(
        screenHeight: screenHeight,
        scaffoldKey: scaffoldKey,
      ),
      drawer: RecipeSideDrawer(),
      body: ListView(
        padding: EdgeInsets.only(left: screenLeftPad, right: screenRightPad, top: screenTopPad, bottom: screenBottomPad),
        children: [

          // recipe cards
          RecipeCard(imagePath: "assets/images/recipes/beef-burger.jpg", recipeName: "Beef Burger"),
          RecipeCard(imagePath: "assets/images/recipes/spaghetti.jpg", recipeName: "Spaghetti"),
          RecipeCard(imagePath: "assets/images/recipes/chocolate-ice-cream.jpg", recipeName: "Chocolate Ice Cream"),
          RecipeCard(imagePath: "assets/images/recipes/biryani.jpg", recipeName: "Chicken Biryani"),
          RecipeCard(imagePath: "assets/images/recipes/broast.jpg", recipeName: "Fried Chicken"),
          RecipeCard(imagePath: "assets/images/recipes/medium-rare.jpg", recipeName: "Steak (Medium Rare)"),
          RecipeCard(imagePath: "assets/images/recipes/pizza.jpg", recipeName: "BBQ Pizza"),

        ],
      ),
    );
  }
}
