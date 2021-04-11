import 'package:flutter/material.dart';
import 'package:recipe_app/app-config.dart';
import 'package:recipe_app/components/TextFieldAbstract.dart';

// ignore: must_be_immutable
class LongTextField extends AbstractTextField{

  final Color pinkTheme = RecipeAppTheme.pinkTheme;
  String hintText, labelText;
  IconData prefixIcon;
  var onValidateFunc, onSaveFunc;

  LongTextField({
    @required this.hintText,
    @required this.labelText,
    this.prefixIcon,
    @required this.onValidateFunc,
    @required this.onSaveFunc
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        enabledBorder: enabledBorder(5),
        focusedBorder: focusedBorder(5, pinkTheme),
        errorBorder: errorBorder(5),
        focusedErrorBorder: errorBorder(5),
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (val){
        return onValidateFunc(val);
      },
      onSaved: (val){
        onSaveFunc(val);
      },
    );
  }
}
