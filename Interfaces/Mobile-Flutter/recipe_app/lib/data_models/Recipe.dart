
import 'dart:typed_data';

class Recipe{

  // attributes
  String id, name, cuisineId, userId;
  Uint8List image;

  // constructor with optional parameters
  Recipe({this.id, this.name, this.cuisineId, this.userId, this.image});

  // takes a decoded JSON-Object and initiates then returns the User object
  factory Recipe.fromJson(Map<String, dynamic> jsonResponse) {
    return new Recipe(
      // ?? 0: if by chance the value is null at a KEY, then it assigns 0
      id: jsonResponse["id"] ?? 0,
      name: jsonResponse["name"] ?? 0,
      image: jsonResponse["image"] ?? 0,
      cuisineId: jsonResponse["cuisineId"] ?? 0,
      userId: jsonResponse["userId"] ?? 0,
    );
  }

  // returns a JSON object: {string, dynamic}
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "image": this.image,
      "cuisineId": this.cuisineId,
      "userId": this.userId
    };
  }
}