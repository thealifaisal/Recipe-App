import 'package:flutter/material.dart';
import 'package:recipe_app/app-config.dart';

class RecipeDrawerTile extends StatelessWidget {

  final pinkTheme = RecipeAppTheme.pinkTheme;
  IconData tileIcon;
  String title;
  var onTap;

  RecipeDrawerTile({@required this.tileIcon, @required this.title, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        tileIcon,
        color: pinkTheme,
      ),
      title: Text(title),
      onTap: onTap,
    );
  }
}
