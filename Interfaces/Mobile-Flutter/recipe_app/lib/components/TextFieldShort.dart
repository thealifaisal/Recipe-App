import 'package:flutter/material.dart';
import 'package:recipe_app/app-config.dart';
import 'package:recipe_app/components/TextFieldAbstract.dart';

// ignore: must_be_immutable
class ShortTextField extends AbstractTextField {

  final Color pinkTheme = RecipeAppTheme.pinkTheme;
  String hintText, labelText;
  IconData prefixIcon, suffixIcon;
  var onValidateFunc, onSaveFunc;
  var keyboardType;

  ShortTextField({
    @required this.hintText,
    @required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    @required this.onValidateFunc,
    @required this.onSaveFunc,
    this.keyboardType
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: enabledBorder(5),
        focusedBorder: focusedBorder(5, pinkTheme),
        errorBorder: errorBorder(5),
        focusedErrorBorder: errorBorder(5),
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon)
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (val){
        return onValidateFunc(val);
      },
      onSaved: (val){
        onSaveFunc(val);
      },
      keyboardType: keyboardType,
    );
  }
}
