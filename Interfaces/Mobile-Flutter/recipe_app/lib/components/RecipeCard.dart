import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/app-config.dart';

// ignore: must_be_immutable
class RecipeCard extends StatelessWidget {

  String imagePath, recipeName, description, userId;
  int cuisineId, id;
  final pinkTheme = RecipeAppTheme.pinkTheme;
  double screenHeight, screenWidth;
  var onPressedFunc;
  IconData favIcon;
  String imageByteString;

  RecipeCard({
    this.id,
    this.imagePath = "assets/images/placeholder-image.png",
    this.imageByteString,
    this.recipeName,
    this.description,
    this.userId,
    this.cuisineId,
    this.favIcon=Icons.favorite_border
  });

  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 5),
      child: Card(
        shadowColor: pinkTheme.withOpacity(0.6),
        elevation: 4,
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
                child: this.imageByteString != null ? Image.memory(
                  base64Decode(imageByteString),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  isAntiAlias: false,
                ) : Image.asset(
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

                  InkWell(
                    onTap: (){
                      onPressedFunc(context);
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        recipeName,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      IconButton(
                        onPressed: (){},
                        icon: Icon(
                          favIcon,
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
