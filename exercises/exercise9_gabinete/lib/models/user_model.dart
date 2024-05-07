// import statement(s)
import 'dart:convert';

class UserDetails {
  // class that will contain user's info
  String? id;
  String email;
  String firstName;
  String lastName;

  // Constructor
  UserDetails({
    this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  // Factory constructor to instantiate object from json format
  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }

  static List<UserDetails> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data
        .map<UserDetails>((dynamic d) => UserDetails.fromJson(d))
        .toList();
  }

  // Convert object to JSON format
  Map<String, dynamic> toJson(UserDetails user) {
    return {
      'email': user.email,
      'firstName': user.firstName,
      'lastName': user.lastName,
    };
  }

  // Add this new method to convert the instance to a Map
  Map<String, dynamic> toMap() {
    return toJson(this);
  }
}
