import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/components/AppBar.dart';
import 'package:recipe_app/components/RecipeCard.dart';
import 'package:recipe_app/app-config.dart';
import 'package:recipe_app/components/SideDrawer.dart';
import 'package:recipe_app/data_models/Recipe.dart';
import 'package:recipe_app/data_models/User.dart';
import 'package:recipe_app/views/recipe-page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {

  final User user;

  HomePage({this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double screenHeight;
  double screenWidth;
  Color pinkTheme;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future getAllRecipes()async{
    String ipAddress = RecipeAppTheme.ipAddress;
    String portNo = RecipeAppTheme.httpsPort;
    Map<String,String> headers = {'Content-Type':'application/json', 'Accept':'application/json'};

    var url = Uri.parse('https://'+ipAddress+':'+portNo+'/api/recipes');

    http.Response response = await http.get(
        url,
        headers: headers
    );

    print(response.statusCode);
    List<Recipe> recipeList = [];

    if(response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body.toString());

      print(jsonResponse[0]["id"]);

      for(var recipe in jsonResponse){
        recipeList.add(Recipe.fromJson(recipe));
      }
    }

    return recipeList;
  }

  void onPressedFunc(BuildContext context){

  }

  @override
  void initState() {

    pinkTheme = RecipeAppTheme.pinkTheme;

    getAllRecipes();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
      appBar: RecipeAppBar(
        screenHeight: screenHeight,
        scaffoldKey: scaffoldKey,
      ),
      drawer: RecipeSideDrawer(),
      body: FutureBuilder(
        future: getAllRecipes(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasError){
                print("Error: ${snapshot.error}");
                return AlertDialog(
                  title: Text(
                    'Recipes Cannot Be Fetched',
                    textAlign: TextAlign.center,
                  ),
                  content: Text(
                    'Error: ${snapshot.error}',
                  ),
                );
              }
              else{
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    return InkWell(
                      child: RecipeCard(
                        id: snapshot.data[index].id,
                        recipeName: snapshot.data[index].name,
                        description: snapshot.data[index].description,
                        imageByteString: snapshot.data[index].image,
                        cuisineId: snapshot.data[index].cuisineId,
                        userId: snapshot.data[index].userId,
                      ),
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              settings: RouteSettings(
                                  name: "view_recipe"
                              ),
                              builder: (context)=>RecipePage(

                              )
                          ),
                        );
                      },
                    );
                  },
                );
              }
            }
            else{
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              );
            }
          }
      ),
    );
  }
}
