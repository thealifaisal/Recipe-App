
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipe_app/app-config.dart';
import 'package:recipe_app/data_models/User.dart';
import 'package:recipe_app/views/home-page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController{

  static Future authenticateUser(BuildContext context, String email, String password)async{

    String ipAddress = RecipeAppTheme.ipAddress;
    String portNo = RecipeAppTheme.httpsPort;
    Map<String,String> headers = {'Content-Type':'application/json', 'Accept':'application/json'};

    var url = Uri.parse('https://'+ipAddress+':'+portNo+'/api/login');

    http.Response response = await http.post(
      url,
      body: jsonEncode({
        "id": email,
        "password": password,
      }),
      headers: headers
    );

    print(response.statusCode);

    if(response.statusCode == 200){

      var jsonResponse = jsonDecode(response.body);
      User user = User.fromJson(jsonResponse);

      print("success");

      // saving login flag and userID in shared storage
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString("user", jsonEncode(user));
      sp.setString("isLogin", "1");

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context)=>HomePage(user: user,)),
              (route) => false
      );
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response.statusCode.toString() + ": " +response.reasonPhrase),
        duration: Duration(seconds: 3),
      ));
    }
  }

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