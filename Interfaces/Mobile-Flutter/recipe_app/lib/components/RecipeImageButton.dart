import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:recipe_app/app-config.dart';

// ignore: must_be_immutable
class RecipeImageButton extends StatelessWidget {

  final Color pinkTheme = RecipeAppTheme.pinkTheme;
  double screenHeight, screenWidth, elevation;
  String recipeImagePath;
  var onPressedFunc;
  Uint8List imageByteString;

  // recipeImage: when no path is passed, default is used
  RecipeImageButton({
    this.recipeImagePath = "assets/images/placeholder-image.png",
    this.onPressedFunc,
    this.elevation = 3,
    this.imageByteString
  });

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
          elevation: elevation,
          shadowColor: pinkTheme.withOpacity(0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          ),
          child: Container(
            padding: EdgeInsets.all(3),
            height: screenHeight * 0.25,
            width: screenWidth,
            child: this.imageByteString != null ? Image.memory(
              imageByteString,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              isAntiAlias: false,
            ) : Image.asset(
              recipeImagePath,
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
