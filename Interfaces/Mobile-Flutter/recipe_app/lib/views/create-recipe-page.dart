import 'package:flutter/material.dart';
import 'package:recipe_app/app-config.dart';
import 'package:recipe_app/components/AppBar.dart';
import 'package:recipe_app/components/RecipeImageButton.dart';
import 'package:recipe_app/components/SideDrawer.dart';

class CreateRecipePage extends StatefulWidget {
  @override
  _CreateRecipePageState createState() => _CreateRecipePageState();
}

class _CreateRecipePageState extends State<CreateRecipePage> {

  final Color pinkTheme = RecipeAppTheme.pinkTheme;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  double screenHeight, screenWidth;
  double screenLeftPad = RecipeAppTheme.screenLeftPad;
  double screenRightPad = RecipeAppTheme.screenRightPad;
  double screenTopPad = RecipeAppTheme.screenTopPad;
  double screenBottomPad = RecipeAppTheme.screenBottomPad;

  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
      appBar: RecipeAppBar(scaffoldKey: scaffoldKey, screenHeight: screenHeight,),
      drawer: RecipeSideDrawer(),
      body: ListView(
        padding: EdgeInsets.only(left: screenLeftPad, right: screenRightPad, top: screenTopPad, bottom: screenBottomPad),
        children: [

          RecipeImageButton(recipeImage: "assets/images/recipes/biryani.jpg", onPressedFunc: (){print("+");},),

          

        ],
      ),
    );
  }
}
