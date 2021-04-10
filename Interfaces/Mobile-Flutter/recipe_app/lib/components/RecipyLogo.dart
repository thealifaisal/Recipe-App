import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/RecipeAppTheme.dart';

class RecipyLogo extends StatelessWidget {

  final Color pinkTheme = RecipeAppTheme.pinkTheme;
  double recipyFontSize, dotFontSize;

  RecipyLogo({@required this.recipyFontSize, @required this.dotFontSize});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        TextSpan(
            children: [
              TextSpan(
                  text: "Recipy",
                  style: GoogleFonts.raleway(
                      fontSize: recipyFontSize,
                      color: Colors.black
                  )
              ),
              TextSpan(
                  text: '.',
                  style: TextStyle(
                      fontSize: dotFontSize,
                      color: pinkTheme
                  )
              )
            ]
        )
    );
  }
}
