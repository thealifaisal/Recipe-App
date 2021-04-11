import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/app-config.dart';

// ignore: must_be_immutable
class RecipeCard extends StatelessWidget {

  String imagePath, recipeName;
  final pinkTheme = RecipeAppTheme.pinkTheme;
  double screenHeight, screenWidth;

  RecipeCard({@required this.imagePath, @required this.recipeName});

  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(8),
      child: Card(
        shadowColor: pinkTheme.withOpacity(0.8),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),

        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
          child: Column(
            children: [

              //
              // Image Container
              //
              Container(
                height: screenHeight * 0.18,
                width: screenWidth,
                margin: EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  isAntiAlias: false,

                ),
              ),

              //
              // Recipe Title + Icon Buttons (Favorite, Share)
              //

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      recipeName,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      IconButton(
                        onPressed: (){},
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.pink,
                        ),
                      ),

                      IconButton(
                        onPressed: (){},
                        icon: Icon(
                          Icons.share,
                        ),
                      ),
                    ],
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
