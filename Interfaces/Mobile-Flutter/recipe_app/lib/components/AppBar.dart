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

  // when don't want to show drawer, and want to show back button
  // by default = true; open drawer
  bool drawer;
  // by default = Icons.line_weight_rounded; show drawer icon
  IconData appBarIcon;

  RecipeAppBar({@required this.screenHeight, @required this.scaffoldKey, this.drawer=true, this.appBarIcon=Icons.line_weight_rounded});

  @override
  Widget build(BuildContext context) {

    return AppBar(
      leading: InkWell(
        onTap: (){
          if(drawer){
            scaffoldKey.currentState.openDrawer();
          }
          else{
            // if drawer = false, this means the icon is back button and pop the page from stack
            Navigator.of(context).pop();
          }
        },
        child: Icon(
          appBarIcon,
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
