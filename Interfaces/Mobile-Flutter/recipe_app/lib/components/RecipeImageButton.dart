import 'package:flutter/material.dart';
import 'package:recipe_app/app-config.dart';

// ignore: must_be_immutable
class RecipeImageButton extends StatelessWidget {

  final Color pinkTheme = RecipeAppTheme.pinkTheme;
  double screenHeight, screenWidth;
  String recipeImage;
  var onPressedFunc;

  // recipeImage: when no path is passed, default is used
  RecipeImageButton({this.recipeImage = "assets/images/placeholder-image.png", this.onPressedFunc});

  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        //
        // Image Container
        //
        Material(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          ),
          child: Container(
            padding: EdgeInsets.all(3),
            height: screenHeight * 0.25,
            width: screenWidth,
            child: Image.asset(
              recipeImage,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              isAntiAlias: false,
            ),
          ),
        ),

        //
        // Add Image Button
        //
        Padding(
          padding: const EdgeInsets.all(7.0),
          child: MaterialButton(
              elevation: 3,
              color: Colors.white.withOpacity(0.7),
              height: screenHeight * 0.05,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                      color: pinkTheme
                  )
              ),
              onPressed: onPressedFunc,
              child: Icon(
                Icons.add_circle_outline,
                color: pinkTheme,
              )
          ),
        )
      ],
    );
  }
}
