import 'package:flutter/material.dart';

abstract class AbstractTextField extends StatelessWidget {

  OutlineInputBorder errorBorder(double borderRadius){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(
            color: Colors.red
        )
    );
  }

  OutlineInputBorder focusedBorder(double borderRadius, Color colorTheme){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(
            color: colorTheme
        )
    );
  }

  OutlineInputBorder enabledBorder(double borderRadius){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

}
