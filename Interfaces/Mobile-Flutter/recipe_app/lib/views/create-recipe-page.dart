import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:recipe_app/app-config.dart';
import 'package:recipe_app/components/AppBar.dart';
import 'package:recipe_app/components/RecipeImageButton.dart';
import 'package:recipe_app/components/RecipeTextButton.dart';
import 'package:recipe_app/components/TextFieldShort.dart';
import 'package:recipe_app/components/SideDrawer.dart';
import 'package:recipe_app/controller/TextFieldController.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


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

  List<MapEntry<int, String>> cuisinesList = [MapEntry(1,'Pakistani'), MapEntry(2,'Italian'), MapEntry(3, 'Indian')];
  int selectedCuisine;

  List<MapEntry<int, String>> ingredientsList = [MapEntry(1,'tomatoes'), MapEntry(2,'eggs'), MapEntry(3, 'milk')];
  List<int> selectedIngredients = [];

  List<String> recipeDirections = [];

  Uint8List _imageByteString;

  void getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    _imageByteString = await pickedFile.readAsBytes();

    setState(() {

    });
  }

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
            imageByteString: _imageByteString,
            onPressedFunc: (){
              getImage();
            },
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

                    // ShortTextField(
                    //   hintText: "Pakistani",
                    //   labelText: "Cuisine",
                    //   prefixIcon: Icons.public,
                    //   onValidateFunc: TextFieldController.nameValidator,
                    //   onSaveFunc: (val){this.cuisineName = val;},
                    //   keyboardType: TextInputType.name,
                    // ),

                    Material(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Colors.black)),
                      child: Container(
                        alignment: Alignment.center,
                        height: 45,
                        width: screenWidth,
                        child: DropdownButtonFormField(
                          value: this.selectedCuisine,
                          onChanged: (val) => this.selectedCuisine = val,
                          onSaved: (val) => this.selectedCuisine = val,
                          items: cuisinesList
                              .map((item) => DropdownMenuItem(
                            value: item.key,
                            child: Text(item.value),
                          )).toList(),
                          isExpanded: true,
                          // makes the dropdown of it's parent size. e.g: Container
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              hintText: 'Select Cuisine',
                              labelStyle: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey
                              ),
                              filled: true,
                              fillColor: Colors.white70
                          ),
                          isDense: true,
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20,),

                    MultiSelectDialogField<int>(
                      // items: ingredientsList.map((e) => MultiSelectItem(e, e)).toList(),
                      items: ingredientsList.map((e) => MultiSelectItem(e.key, e.value)).toList(),
                      listType: MultiSelectListType.LIST,
                      onConfirm: (values) {
                        selectedIngredients = values;
                      },
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1
                          ),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      searchable: true,
                      title: Text('Ingredients'),
                      autovalidateMode: AutovalidateMode.always,
                      buttonText: Text(
                        'Select Ingredients',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black.withOpacity(0.6)
                        ),
                      ),
                      onSaved: (selected){
                        selectedIngredients = selected;
                      },
                      height: screenHeight * 0.5,
                      buttonIcon: Icon(Icons.keyboard_arrow_down),
                    ),

                    // LongTextField(
                    //   hintText: "Eggs, Oil, Tomatoes, ...",
                    //   labelText: "Ingredients (comma separated)",
                    //   prefixIcon: Icons.list,
                    //   onValidateFunc: TextFieldController.nameValidator,
                    //   onSaveFunc: (val){this.ingredients = val;},
                    // ),

                    SizedBox(height: 20,),

                    TextFieldTags(
                      initialTags: recipeDirections,
                      tagsStyler: TagsStyler(
                          tagTextStyle: TextStyle(fontWeight: FontWeight.normal),
                          tagDecoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(5.0)),
                          tagCancelIcon: Icon(Icons.cancel, size: 18.0, color: Colors.black),
                          tagPadding: const EdgeInsets.all(6.0)
                      ),
                      textFieldStyler: TextFieldStyler(
                        isDense: false,
                        helperText: 'Enter Recipe Steps',
                        hintText: 'Enter Recipe Steps',
                      ),
                      onTag: (tag) {
                        recipeDirections.add(tag);
                      },
                      onDelete: (tag) {
                        recipeDirections.remove(tag);
                        print(recipeDirections);
                      }
                    ),

                    // LongTextField(
                    //   hintText: "Add 5 Eggs, 1 Table Spoon Oil, ...",
                    //   labelText: "Steps (comma separated)",
                    //   prefixIcon: Icons.format_list_numbered,
                    //   onValidateFunc: TextFieldController.nameValidator,
                    //   onSaveFunc: (val){this.steps = val;},
                    // ),

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
