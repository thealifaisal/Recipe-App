
import 'dart:typed_data';

class Recipe{

  // attributes
  String name, description, userId;
  int id, cuisineId;
  String image;

  // constructor with optional parameters
  Recipe({this.id, this.name, this.description, this.cuisineId, this.userId, this.image});

  // takes a decoded JSON-Object and initiates then returns the User object
  factory Recipe.fromJson(Map<String, dynamic> jsonResponse) {
    return new Recipe(
      // ?? 0: if by chance the value is null at a KEY, then it assigns 0
      id: int.parse(jsonResponse["id"].toString()) ?? 0,
      name: jsonResponse["name"],
      description: jsonResponse["description"],
      image: jsonResponse["image"],
      cuisineId: int.parse(jsonResponse["cuisineId"].toString()) ?? 0,
      userId: jsonResponse["userId"] ?? 0,
    );
  }

  // returns a JSON object: {string, dynamic}
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "description": this.description,
      "image": this.image,
      "cuisineId": this.cuisineId,
      "userId": this.userId
    };
  }
}