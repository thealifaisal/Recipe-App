
class User{

  // attributes
  String name, email, password;

  // constructor with optional parameters
  User({this.name, this.email, this.password});

  // takes a decoded JSON-Object and initiates then returns the User object
  factory User.fromJson(Map<String, dynamic> jsonResponse) {
    return new User(
      // ?? 0: if by chance the value is null at a KEY, then it assigns 0
      name: jsonResponse["name"] ?? 0,
      email: jsonResponse["email"] ?? 0,
      password: jsonResponse["password"] ?? 0,
    );
  }

  // returns a JSON object: {string, dynamic}
  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "email": this.email,
      "password": this.password
    };
  }
}