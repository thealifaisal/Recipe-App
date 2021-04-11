import 'package:flutter/material.dart';
import 'package:recipe_app/app-config.dart';
import 'package:recipe_app/components/AppBar.dart';
import 'package:recipe_app/components/RecipeDataTable.dart';
import 'package:recipe_app/components/RecipeImageButton.dart';
import 'package:recipe_app/components/RecipeLabel.dart';
import 'package:recipe_app/components/SideDrawer.dart';

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {

  double screenHeight;
  double screenWidth;
  Color pinkTheme;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  var ingredients = ["Tomatoes", "Onions", "Cheese", "Beef Patty", "Lettuce", "Buns"];
  var steps = ["Heat the Buns", "Place Lettuce", "Place patty", "Place the cheese", "Add tomatoes", "Add onions"];

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
        drawer: false,
        appBarIcon: Icons.arrow_back
        ,
      ),
      drawer: RecipeSideDrawer(),
      body: ListView(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        children: [

          RecipeImageButton(recipeImage: "assets/images/recipes/beef-burger.jpg", elevation: 4,),

          SizedBox(height: 10,),

          RecipeLabel(recipeName: "Beef Burger", cuisineName: "American", elevation: 3,),

          SizedBox(height: 10,),

          RecipeDataTable(colName: "Ingredients", dataList: ingredients, elevation: 3,),

          SizedBox(height: 10,),

          RecipeDataTable(colName: "Steps", dataList: steps, elevation: 3,),
        ],
      ),
    );
  }
}
