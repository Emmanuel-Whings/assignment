import 'dart:convert';

class User {
  String name;
  String email;
  String bio;

  User({
    required this.name,
    required this.email,
    required this.bio,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        bio: json["bio"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "bio": bio,
      };
}
