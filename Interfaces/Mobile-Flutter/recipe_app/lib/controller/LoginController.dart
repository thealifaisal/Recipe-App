
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController{
  static void LogoutUser(BuildContext context){
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text('Logout'),
      content: Text('Do you want to logout of the user?'),
      actions: [
        MaterialButton(
          onPressed: ()async{
            // sets login flag in shared storage to 0
            // so that on next start of app, the user will be directed
            // to login page
            SharedPreferences sp = await SharedPreferences.getInstance();
            sp.setString("isLogin", "0");
            Navigator.of(context).pushNamedAndRemoveUntil('login', (route) => false);
          },
          color: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
            side: BorderSide(
                color: Colors.red
            ),
          ),
          child: Text(
            'Yes',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        MaterialButton(
          onPressed: (){
            Navigator.of(context, rootNavigator: true).pop();
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
            side: BorderSide(
                color: Colors.blue
            ),
          ),
          color: Colors.white,
          child: Text('No', style: TextStyle(color: Colors.blue),),
        ),
      ],
    ));
  }
}