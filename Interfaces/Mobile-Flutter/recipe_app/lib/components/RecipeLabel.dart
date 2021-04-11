import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/app-config.dart';

// ignore: must_be_immutable
class RecipeLabel extends StatelessWidget {

  double screenHeight;
  double screenWidth;
  double recipeSize, cuisineSize, elevation;
  String recipeName, cuisineName;
  final Color pinkTheme = RecipeAppTheme.pinkTheme;

  RecipeLabel({@required this.recipeName, @required this.cuisineName, this.recipeSize=30, this.cuisineSize=15, this.elevation=2});

  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Material(
      elevation: elevation,
      shadowColor: pinkTheme.withOpacity(0.6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        width: screenWidth,
        padding: EdgeInsets.all(5),
        child: ListTile(
          title: Text(
            recipeName,
            style: GoogleFonts.raleway(
                fontSize: recipeSize
            ),
          ),
          subtitle: Text(
            cuisineName + " Cuisine",
            style: TextStyle(
                fontSize: cuisineSize
            ),
          ),
        ),
      ),
    );
  }
}
