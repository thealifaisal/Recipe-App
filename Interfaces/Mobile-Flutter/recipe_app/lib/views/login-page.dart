import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_app/components/RecipeTextButton.dart';
import 'package:recipe_app/components/RecipyLogo.dart';
import 'package:recipe_app/components/TextFieldPassword.dart';
import 'package:recipe_app/components/TextFieldShort.dart';
import 'package:recipe_app/controller/LoginController.dart';
import 'package:recipe_app/controller/TextFieldController.dart';
import 'package:recipe_app/views/register-page.dart';
import 'package:recipe_app/app-config.dart';
import 'package:recipe_app/views/home-page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  double screenHeight;
  double screenWidth;
  String bgImage;
  Color pinkTheme;
  double borderRadius;
  bool hidePass;
  IconData visIcon;
  String email, password;
  String ipAddress, portNo;

  var formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {

    bgImage = 'assets/images/bg/sweets-bg.jpg';
    pinkTheme = RecipeAppTheme.pinkTheme;
    borderRadius = 5;
    hidePass = true;
    visIcon = Icons.visibility;
    ipAddress = RecipeAppTheme.ipAddress;
    portNo = RecipeAppTheme.httpPort;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: pinkTheme,
      key: scaffoldKey,
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

          // white form panel
          Align(
            alignment: Alignment.center,
            child: Material(
              elevation: 5,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius)
              ),
              child: Container(
                height: screenHeight * 0.75,
                width: screenWidth * 0.85,
                padding: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // Logo
                    RecipyLogo(dotFontSize: 40, recipyFontSize: 60,),

                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          //
                          // Email TextField
                          //
                          ShortTextField(
                            hintText: "abc@gmail.com",
                            labelText: "Email",
                            prefixIcon: Icons.email,
                            keyboardType: TextInputType.emailAddress,
                            onValidateFunc: TextFieldController.emailValidator,
                            onSaveFunc: (val){this.email = val;}
                          ),

                          SizedBox(height: 20,),

                          //
                          // Password TextField
                          //
                          PasswordTextField(
                            hintText: "Password",
                            labelText: "Password",
                            onValidateFunc: TextFieldController.passwordValidator,
                            onSaveFunc: (val){this.password = val;},
                            prefixIcon: Icons.security_sharp,
                            hidePass: hidePass,
                            visIcon: visIcon,
                            showPassFunc: (){
                              setState(() {
                                if(hidePass){
                                  visIcon = Icons.visibility_off;
                                }
                                else{
                                  visIcon = Icons.visibility;
                                }
                                hidePass = !hidePass;
                              });
                            },
                          )


                        ],
                      ),
                    ),

                    Container(
                      child: Column(
                        children: [
                          Text('Don`t have a recipy? Come join us.'),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => RegisterPage()
                                )
                              );
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  decoration: TextDecoration.underline,
                                  color: pinkTheme
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    RecipeTextButton(
                      btnText: "Login",
                      height: 50,
                      width: 150,
                      onPressedFunc: ()async{
                        if(formKey.currentState.validate()){
                          formKey.currentState.save();
                          print('form valid');

                          var i = await LoginController.authenticateUser(context, email, password);

                        }
                        else{
                          print('form invalid');
                        }
                      },
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
