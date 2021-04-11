import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_app/app-config.dart';
import 'package:recipe_app/components/RecipeTextButton.dart';
import 'package:recipe_app/components/RecipyLogo.dart';
import 'package:recipe_app/components/TextFieldPassword.dart';
import 'package:recipe_app/components/TextFieldShort.dart';
import 'package:recipe_app/controller/TextFieldController.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  double screenHeight;
  double screenWidth;
  String bgImage;
  Color pinkTheme;
  double borderRadius;
  bool hidePass;
  IconData visIcon;
  String name, email, password;

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {

    bgImage = 'assets/images/bg/sweets-bg.jpg';
    pinkTheme = RecipeAppTheme.pinkTheme;
    borderRadius = 5;
    hidePass = true;
    visIcon = Icons.visibility;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

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
                          // Name
                          //
                          ShortTextField(
                              hintText: "Ali",
                              labelText: "Name",
                              prefixIcon: Icons.person_pin,
                              keyboardType: TextInputType.name,
                              onValidateFunc: TextFieldController.nameValidator,
                              onSaveFunc: (val){this.name = val;}
                          ),

                          SizedBox(height: 20,),

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
                          Text('Already have a recipy? Let`s login.'),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Login',
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
                      btnText: "Sign Up",
                      height: 50,
                      width: 150,
                      onPressedFunc: (){
                        if(formKey.currentState.validate()){
                          formKey.currentState.save();
                          print('form valid');
//                          Navigator.of(context).pushReplacement(
//                              MaterialPageRoute(
//                                settings: RouteSettings(
//                                    name: "home"
//                                ),
//                                builder: (context)=>HomePage(),
//                              )
//                          );
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
