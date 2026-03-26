import '../../../../core/extension/json_extension.dart';
import '../../domain/entity/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    required super.phone,
    required super.website,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json.parseInt('id'),
      name: json.parseString('name'),
      username: json.parseString('username'),
      email: json.parseString('email'),
      phone: json.parseString('phone'),
      website: json.parseString('website'),
    );
  }

  User toEntity() {
    return User(
      id: id,
      name: name,
      username: username,
      email: email,
      phone: phone,
      website: website,
    );
  }
}
