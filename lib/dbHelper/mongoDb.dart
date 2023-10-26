import 'dart:developer';

import 'package:demo_auth/dbHelper/constants.dart';
import 'package:demo_auth/models/user.dart';
import 'package:mongo_dart/mongo_dart.dart' show Db, where;

class MongoDB {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
  }


  static Future<String> insert(UserModel data) async {
  try {
    var existingUser = await userCollection.findOne(
      where.eq('userName', data.userName),
    );
 
 
    if (existingUser != null) {
      // A user with the same username already exists
      return "Username is already in use";
    }

    var result = await userCollection.insertOne(data.toJson());

    if (result.isSuccess) {
      return "Data Inserted";
    } else {
      return "Something went wrong";
    }
  } catch (e) {
    print(e.toString());
    return e.toString();
  }
}

}
