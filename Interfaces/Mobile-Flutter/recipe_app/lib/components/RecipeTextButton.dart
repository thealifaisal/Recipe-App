import 'package:flutter/material.dart';
import 'package:recipe_app/app-config.dart';

// ignore: must_be_immutable
class RecipeTextButton extends StatelessWidget {

  final pinkTheme = RecipeAppTheme.pinkTheme;
  var onPressedFunc;
  double height, width, borderRadius, elevation;
  String btnText;

  RecipeTextButton({
    @required this.btnText,
    @required this.height,
    @required this.width,
    this.elevation = 1,
    this.borderRadius = 10,
    this.onPressedFunc
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: height,
          child: MaterialButton(
            elevation: elevation,
            onPressed: onPressedFunc,
            color: pinkTheme,
            child: Text(
              btnText,
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
      ],
    );
  }
}
