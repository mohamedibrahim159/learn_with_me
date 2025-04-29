import 'package:equatable/equatable.dart';
import '../../domain/entities/user.dart';

class UserModel extends User with EquatableMixin {
  final String id;
  final String name;
  final String email;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
  }) : super(id: id, name: name, email: email);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  User toEntity() {
    return User(id: id, name: name, email: email);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  @override
  List<Object?> get props => [id, name, email];
}