import 'package:flutter/material.dart';
import 'package:recipe_app/app-config.dart';
import 'package:recipe_app/components/AppBar.dart';
import 'package:recipe_app/components/RecipeCard.dart';
import 'package:recipe_app/components/SideDrawer.dart';
import 'package:recipe_app/views/recipe-page.dart';

class FavoriteRecipesPage extends StatefulWidget {
  @override
  _FavoriteRecipesPageState createState() => _FavoriteRecipesPageState();
}

class _FavoriteRecipesPageState extends State<FavoriteRecipesPage> {

  double screenHeight;
  double screenWidth;
  Color pinkTheme;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {

    pinkTheme = RecipeAppTheme.pinkTheme;
    // TODO: implement initState
    super.initState();
  }

  void onPressedFunc(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(
          settings: RouteSettings(
              name: "view_recipe"
          ),
          builder: (context)=>RecipePage()
      ),
    );
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
        padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
        children: [

          // recipe cards
          RecipeCard(
            imagePath: "assets/images/recipes/beef-burger.jpg",
            recipeName: "Beef Burger",
            favIcon: Icons.favorite,
          ),

          RecipeCard(
            imagePath: "assets/images/recipes/spaghetti.jpg",
            recipeName: "Spaghetti",
            favIcon: Icons.favorite,
          ),

        ],
      ),
    );
  }
}
