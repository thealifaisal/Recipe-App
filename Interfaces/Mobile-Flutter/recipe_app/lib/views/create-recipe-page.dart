import 'package:flutter/material.dart';
import 'package:recipe_app/app-config.dart';
import 'package:recipe_app/components/AppBar.dart';
import 'package:recipe_app/components/RecipeImageButton.dart';
import 'package:recipe_app/components/RecipeTextButton.dart';
import 'package:recipe_app/components/TextFieldLong.dart';
import 'package:recipe_app/components/TextFieldShort.dart';
import 'package:recipe_app/components/SideDrawer.dart';
import 'package:recipe_app/controller/TextFieldController.dart';

class CreateRecipePage extends StatefulWidget {
  @override
  _CreateRecipePageState createState() => _CreateRecipePageState();
}

class _CreateRecipePageState extends State<CreateRecipePage> {

  final Color pinkTheme = RecipeAppTheme.pinkTheme;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  double screenHeight, screenWidth;
  double screenLeftPad = RecipeAppTheme.screenLeftPad;
  double screenRightPad = RecipeAppTheme.screenRightPad;
  double screenTopPad = RecipeAppTheme.screenTopPad;
  double screenBottomPad = RecipeAppTheme.screenBottomPad;
  String recipeName, cuisineName, ingredients, steps;

  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
      appBar: RecipeAppBar(scaffoldKey: scaffoldKey, screenHeight: screenHeight,),
      drawer: RecipeSideDrawer(),
      body: ListView(
        padding: EdgeInsets.only(left: screenLeftPad, right: screenRightPad, top: screenTopPad, bottom: screenBottomPad),
        children: [

          RecipeImageButton(
            recipeImage: "assets/images/recipes/biryani.jpg",
            onPressedFunc: (){print("+");},
            elevation: 3,
          ),

          SizedBox(height: 10,),

          Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Material(
              elevation: 3,
              shadowColor: pinkTheme.withOpacity(0.6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                width: screenWidth,
                margin: EdgeInsets.only(top: 20, bottom: 20),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [

                    ShortTextField(
                      hintText: "Biryani",
                      labelText: "Recipe Name",
                      prefixIcon: Icons.fastfood,
                      onValidateFunc: TextFieldController.nameValidator,
                      onSaveFunc: (val){this.recipeName = val;},
                      keyboardType: TextInputType.name,
                    ),

                    SizedBox(height: 20,),

                    ShortTextField(
                      hintText: "Pakistani",
                      labelText: "Cuisine",
                      prefixIcon: Icons.public,
                      onValidateFunc: TextFieldController.nameValidator,
                      onSaveFunc: (val){this.cuisineName = val;},
                      keyboardType: TextInputType.name,
                    ),

                    SizedBox(height: 20,),

                    LongTextField(
                      hintText: "Eggs, Oil, Tomatoes, ...",
                      labelText: "Ingredients (comma separated)",
                      prefixIcon: Icons.list,
                      onValidateFunc: TextFieldController.nameValidator,
                      onSaveFunc: (val){this.ingredients = val;},
                    ),

                    SizedBox(height: 20,),

                    LongTextField(
                      hintText: "Add 5 Eggs, 1 Table Spoon Oil, ...",
                      labelText: "Steps (comma separated)",
                      prefixIcon: Icons.format_list_numbered,
                      onValidateFunc: TextFieldController.nameValidator,
                      onSaveFunc: (val){this.steps = val;},
                    ),

                    SizedBox(height: 20,),

                    RecipeTextButton(
                      btnText: "Create Recipe",
                      height: screenHeight * 0.06,
                      width: 150,
                      borderRadius: 5,
                      onPressedFunc: (){},
                      elevation: 3,
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
