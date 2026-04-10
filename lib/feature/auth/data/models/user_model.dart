import 'package:blog_app/feature/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.id, required super.email, required super.name});

  // Same as above ( above is simplify/syntatic sugar form)
  //UserModel({
  //  required String id,
  //  required String email,
  //  required String name,
  //}) : super(email: email, id: id, name: name, password: password);

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
    );
  }
}
