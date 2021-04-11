import 'package:flutter/material.dart';
import 'package:recipe_app/app-config.dart';
import 'package:recipe_app/components/TextFieldAbstract.dart';

// ignore: must_be_immutable
class PasswordTextField extends AbstractTextField {

  final Color pinkTheme = RecipeAppTheme.pinkTheme;
  String hintText, labelText;
  IconData prefixIcon;
  var onValidateFunc, onSaveFunc, showPassFunc;
  var keyboardType;
  bool hidePass;
  IconData visIcon;

  PasswordTextField({
    @required this.hintText,
    @required this.labelText,
    @required this.onValidateFunc,
    @required this.onSaveFunc,
    @required this.showPassFunc,
    this.prefixIcon,
    this.keyboardType,
    this.hidePass = true,
    this.visIcon = Icons.visibility
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
        suffixIcon: InkWell(
          onTap: showPassFunc,
          child: Icon(visIcon),
        ),
      ),
      obscureText: hidePass,
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
