import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/app-config.dart';
import 'package:recipe_app/components/RecipeDrawerTile.dart';
import 'package:recipe_app/components/RecipyLogo.dart';
import 'package:recipe_app/views/favorite-page.dart';
import 'package:recipe_app/views/create-recipe-page.dart';
import 'package:recipe_app/views/home-page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:recipe_app/controller/LoginController.dart';

// ignore: must_be_immutable
class RecipeSideDrawer extends StatelessWidget {

  final Color pinkTheme = RecipeAppTheme.pinkTheme;
  double screenHeight;

  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height;

    return Drawer(
      child: ListView(
        children: [

          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            height: screenHeight * 0.1,
            child: RecipyLogo(dotFontSize: 32, recipyFontSize: 32,),
          ),

          RecipeDrawerTile(tileIcon: Icons.home, title: "Home Page", onTap: (){
            if(ModalRoute.of(context).settings.name != "home"){
              Navigator.of(context).push(
                MaterialPageRoute(
                  settings: RouteSettings(
                    name: "home"
                  ),
                  builder: (context)=>HomePage()
                ),
              );
            }
          }),

          RecipeDrawerTile(tileIcon: Icons.person_pin, title: "My Profile", onTap: (){}),

          RecipeDrawerTile(tileIcon: Icons.fastfood, title: "Create a Recipe", onTap: (){
            if(ModalRoute.of(context).settings.name != "create_recipe"){
              Navigator.of(context).push(
                MaterialPageRoute(
                    settings: RouteSettings(
                        name: "create_recipe"
                    ),
                    builder: (context)=>CreateRecipePage()
                ),
              );
            }
          }),

          RecipeDrawerTile(tileIcon: Icons.favorite, title: "Favorite Recipes", onTap: (){
            if(ModalRoute.of(context).settings.name != "favorites"){
              Navigator.of(context).push(
                MaterialPageRoute(
                    settings: RouteSettings(
                        name: "favorites"
                    ),
                    builder: (context)=>FavoriteRecipesPage()
                ),
              );
            }
          }),

          // -
          // My Reviews Page: Where a user could see the reviews
          // and edit their reviews on different recipes
          // -


          Divider(),


          RecipeDrawerTile(tileIcon: Icons.settings_applications, title: "App Settings", onTap: (){}),

          RecipeDrawerTile(tileIcon: Icons.info_outline, title: "About Recipy", onTap: (){}),


          Divider(),


          RecipeDrawerTile(tileIcon: Icons.arrow_back_outlined, title: "Logout", onTap: (){
            LoginController.LogoutUser(context);
          }),

        ],
      ),
    );
  }
}
