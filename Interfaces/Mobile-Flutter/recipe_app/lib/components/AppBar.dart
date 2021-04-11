import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/app-config.dart';

import 'RecipyLogo.dart';

// ignore: must_be_immutable
class RecipeAppBar extends StatelessWidget implements PreferredSizeWidget {

  final AppBar appBar = AppBar();
  final Color pinkTheme = RecipeAppTheme.pinkTheme;
  double screenHeight;
  GlobalKey<ScaffoldState> scaffoldKey;

  RecipeAppBar({@required this.screenHeight, @required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {

    return AppBar(
      leading: InkWell(
        onTap: (){
          scaffoldKey.currentState.openDrawer();
        },
        child: Icon(
          Icons.line_weight_rounded,
          color: pinkTheme,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: pinkTheme
        )
      ),
      backgroundColor: Colors.white,
      title: RecipyLogo(dotFontSize: 24, recipyFontSize: 24,),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
