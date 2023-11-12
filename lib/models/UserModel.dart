import 'dart:convert';
/// id : 1
/// first_name : "Anet"
/// last_name : "Doe"
/// email : "adoe0@comcast.net"
/// gender : "Female"
/// avatar : "https://robohash.org/sintessequaerat.png?size=50x50&set=set1"
/// domain : "Sales"
/// available : false

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());
class UserModel {
  UserModel({
      num? id, 
      String? firstName, 
      String? lastName, 
      String? email, 
      String? gender, 
      String? avatar, 
      String? domain, 
      bool? available,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _gender = gender;
    _avatar = avatar;
    _domain = domain;
    _available = available;
}

  UserModel.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _gender = json['gender'];
    _avatar = json['avatar'];
    _domain = json['domain'];
    _available = json['available'];
  }
  num? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _gender;
  String? _avatar;
  String? _domain;
  bool? _available;
UserModel copyWith({  num? id,
  String? firstName,
  String? lastName,
  String? email,
  String? gender,
  String? avatar,
  String? domain,
  bool? available,
}) => UserModel(  id: id ?? _id,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  gender: gender ?? _gender,
  avatar: avatar ?? _avatar,
  domain: domain ?? _domain,
  available: available ?? _available,
);
  num? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get gender => _gender;
  String? get avatar => _avatar;
  String? get domain => _domain;
  bool? get available => _available;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['gender'] = _gender;
    map['avatar'] = _avatar;
    map['domain'] = _domain;
    map['available'] = _available;
    return map;
  }

}