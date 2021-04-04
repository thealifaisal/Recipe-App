import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

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

  OutlineInputBorder errorBorder(double borderRadius){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(
            color: Colors.red
        )
    );
  }

  OutlineInputBorder validBorder(double borderRadius, Color pinkTheme){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(
            color: pinkTheme
        )
    );
  }

  @override
  void initState() {

    bgImage = 'assets/images/sweets-bg.jpg';
    pinkTheme = Color(0xFFB83C82);
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
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Recipy',
                            style: GoogleFonts.raleway(
                              fontSize: 40,
                            )
                          ),
                          TextSpan(
                            text: '.',
                            style: TextStyle(
                              fontSize: 60,
                              color: pinkTheme
                            )
                          )
                        ]
                      )
                    ),

                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          TextFormField(
                            keyboardType: TextInputType.name,
                            enableSuggestions: true,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            onSaved: (val) => this.name = val,
                            validator: (val){
                              if(val.isEmpty){
                                return 'Please enter your valid name.';
                              }
                              else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Name',
                              labelText: 'Name',
                              prefixIcon: Icon(Icons.person_outline),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(borderRadius)
                              ),
                              focusedBorder: validBorder(borderRadius, pinkTheme),
                              errorBorder: errorBorder(borderRadius),
                              focusedErrorBorder: errorBorder(borderRadius),
                            ),
                          ),

                          SizedBox(height: 20,),

                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            enableSuggestions: true,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            onSaved: (val) => this.email = val,
                            validator: (val){
                              if(val.isEmpty || !val.contains('@')){
                                return 'Please enter a valid email.';
                              }
                              else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Email',
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email_outlined),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(borderRadius)
                              ),
                              focusedBorder: validBorder(borderRadius, pinkTheme),
                              errorBorder: errorBorder(borderRadius),
                              focusedErrorBorder: errorBorder(borderRadius),
                            ),
                          ),

                          SizedBox(height: 20,),

                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: hidePass,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            onSaved: (val) => this.password = val,
                            validator: (val){
                              if(val.isEmpty){
                                return 'Please enter a password.';
                              }
                              else if(val.length < 8){
                                return 'Password should be 8 characters long.';
                              }
                              else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Password',
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.security_sharp),
                              suffixIcon: InkWell(
                                child: Icon(visIcon),
                                onTap: (){
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
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(borderRadius),
                              ),
                              focusedBorder: validBorder(borderRadius, pinkTheme),
                              errorBorder: errorBorder(borderRadius),
                              focusedErrorBorder: errorBorder(borderRadius),
                            ),
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

                    MaterialButton(
                      onPressed: (){
                        if(formKey.currentState.validate()){
                          formKey.currentState.save();
                          print('form valid');
//                          Navigator.of(context).push(
//                              MaterialPageRoute(
//                                builder: (context)=>HomePage(),
//                              )
//                          );
                        }
                        else{
                          print('form invalid');
                        }
                      },
                      color: pinkTheme,
                      minWidth: 150,
                      height: 50,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
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
