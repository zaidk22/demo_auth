import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    ObjectId id; // Change the data type from String to ObjectId
    String fullName;
    String email;
    String password;

    UserModel({
        required this.id,
        required this.fullName,
        required this.email,
        required this.password,
    });

    UserModel copyWith({
        ObjectId? id, // Change the parameter data type from String to ObjectId
        String? fullName,
        String? email,
        String? password,
    }) =>
        UserModel(
            id: id ?? this.id,
            fullName: fullName ?? this.fullName,
            email: email ?? this.email,
            password: password ?? this.password,
        );

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: ObjectId.fromHexString(json["_id"]), // Convert the String to ObjectId
        fullName: json["fullName"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id.toHexString(), // Convert the ObjectId to String
        "fullName": fullName,
        "email": email,
        "password": password,
    };
}
