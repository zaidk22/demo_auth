import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    ObjectId id; // Change the data type from String to ObjectId
    String fullName;
    String userName;
    String password;

    UserModel({
        required this.id,
        required this.fullName,
        required this.userName,
        required this.password,
    });

    UserModel copyWith({
        ObjectId? id, // Change the parameter data type from String to ObjectId
        String? fullName,
        String? userName,
        String? password,
    }) =>
        UserModel(
            id: id ?? this.id,
            fullName: fullName ?? this.fullName,
            userName: userName ?? this.userName,
            password: password ?? this.password,
        );

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: ObjectId.fromHexString(json["_id"]), // Convert the String to ObjectId
        fullName: json["fullName"],
        userName: json["userName"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id.toHexString(), // Convert the ObjectId to String
        "fullName": fullName,
        "userName": userName,
        "password": password,
    };
}
