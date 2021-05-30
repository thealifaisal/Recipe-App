import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_app/components/RecipyLogo.dart';
import 'package:recipe_app/data_models/User.dart';
import 'package:recipe_app/views/home-page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:recipe_app/app-config.dart';
import 'login-page.dart';

// ignore: must_be_immutable
class SplashPage extends StatefulWidget {

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  double screenHeight;
  double screenWidth;
  Color pinkTheme;
  String bgImage;

  bool isLogin = false;
  User user;

  // fetches the login status from the shared storage
  void fetchLoginStatus()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    this.isLogin = sp.getString("isLogin")=="1" ? true : false;
  }

  // fetches the user id from the shared storage
  void fetchUser()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String userJsonEncoded = sp.get("user");
    print(userJsonEncoded);
    var userJsonDecoded = jsonDecode(userJsonEncoded);
    this.user = User.fromJson(userJsonDecoded);

    // print("splash: ${this.user.id}");
    // print("splash: ${this.user.name}");
  }

  void routeToNextPage()async{
    if(this.isLogin){

      fetchUser();

      // if user is login, go to HomePage
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context)=>HomePage(/*user: this.user,*/)
          )
      );
    }
    else{
      // if user is not login, go to Login Page
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context)=>LoginPage()
          )
      );
    }
  }//routeToNextPage

  @override
  void initState() {
    super.initState();

    // fetches the login status from the shared storage
    fetchLoginStatus();

    // transition to next-page after 3 seconds
    Timer _timer = new Timer(const Duration(seconds: 3), routeToNextPage);

  } // initState

  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    bgImage = 'assets/images/bg/sweets-bg.jpg';
    pinkTheme = RecipeAppTheme.pinkTheme;

    return Scaffold(
      backgroundColor: pinkTheme,
      body: Stack(
        children: [

          // background design
          Container(
            height: screenHeight * 0.5,
            width: screenWidth,
            color: pinkTheme,
            // bg-image container
            child: Image.asset(
              bgImage,
              filterQuality: FilterQuality.medium,
              alignment: Alignment.topCenter,
              isAntiAlias: true,
              fit: BoxFit.cover,
            ),
          ),

          Center(
            child: Material(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Container(
                margin: EdgeInsets.all(10),
                child: RecipyLogo(
                  dotFontSize: 40,
                  recipyFontSize: 60,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
