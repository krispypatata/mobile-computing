// import statement(s)
import 'dart:convert';

// class that will contain friend's info
class FriendInfo {
  final String name;
  final String nickname;
  final String age;
  final bool isInRelationship;
  final double happinessLevel;
  final String superpower;
  final String motto;

  const FriendInfo({
    required this.name,
    required this.nickname,
    required this.age,
    required this.isInRelationship,
    required this.happinessLevel,
    required this.superpower,
    required this.motto,
  });

  // Factory constructor to instantiate object from json format
  factory FriendInfo.fromJson(Map<String, dynamic> json) {
    return FriendInfo(
      name: json['name'],
      nickname: json['nickname'],
      age: json['age'],
      isInRelationship: json['isInRelationship'],
      happinessLevel: json['happinessLevel'],
      superpower: json['superpower'],
      motto: json['motto'],
    );
  }

  static List<FriendInfo> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<FriendInfo>((dynamic d) => FriendInfo.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(FriendInfo friendInfo) {
    return {
      'name': friendInfo.name,
      'nickname': friendInfo.nickname,
      'age': friendInfo.age,
      'isInRelationship': friendInfo.isInRelationship,
      'happinessLevel': friendInfo.happinessLevel,
      'superpower': friendInfo.superpower,
      'motto': friendInfo.motto,
    };
  }
}
