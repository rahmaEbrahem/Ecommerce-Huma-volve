import 'package:ecommerce_app_huma_volve/features/auth/sign_up/domain/entity/sign_up_entity.dart';

class SignupResModel extends SignUpEntity {
  int? id;

  String? role;
  String? avatar;
  String? creationAt;
  String? updatedAt;

  SignupResModel({
    this.id,
    super.email,
    super.password,
    super.name,
    this.role,
    this.avatar,
    this.creationAt,
    this.updatedAt,
  });

  SignupResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
}
