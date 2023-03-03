import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  final String email;
  final String password;
  final String uid;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        "username": name,
        "email": email,
        "password": password,
        "uid": uid,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      name: snapshot["name"],
      email: snapshot["email"],
      password: snapshot["password"],
      uid: snapshot["uid"],
    );
  }
}
