
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipe_app/app-config.dart';
import 'package:recipe_app/data_models/User.dart';
import 'package:recipe_app/views/home-page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegisterController{

  static Future registerUser(BuildContext context, String email, String password, String name)async{

    String ipAddress = RecipeAppTheme.ipAddress;
    String portNo = RecipeAppTheme.httpsPort;
    Map<String,String> headers = {'Content-Type':'application/json', 'Accept':'application/json'};

    var url = Uri.parse('https://'+ipAddress+':'+portNo+'/api/users');

    http.Response response = await http.post(
        url,
        body: jsonEncode(
            {
              "Email": email,
              "Password": password,
              "Name": name
            }
        ),
        headers: headers
    );

    print(response.statusCode);

    if(response.statusCode == 201){

      User user = User(
          email: email,
          name: name,
          password: password
      );

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
}