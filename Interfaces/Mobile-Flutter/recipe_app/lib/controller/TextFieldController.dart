import 'package:email_validator/email_validator.dart';

class TextFieldController{

  static String nameValidator(String val){
    // message: by default = null
    String message;
    if(val.length == 0){
      message = "Please enter a valid input.";
    }
    return message;
  }

  static String emailValidator(String val){
    // message: by default = null
    String message;
    if(!EmailValidator.validate(val)){
      message = "Please enter a valid email.";
    }
    return message;
  }

  static String passwordValidator(String val){
    // message: by default = null
    String message;
    if(val.length == 0 || val.length < 8 || !val.contains(RegExp(r'[+!@#$%^&*(),.?":{}|<>-]')) || !val.contains(RegExp(r'[0-9]'))){
      message = "Your password must have at least"
          "\n- 8 characters"
          "\n- 1 special character"
          "\n- 1 number";
    }
    return message;
  }
}