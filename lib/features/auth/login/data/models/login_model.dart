import 'package:ecommerce_app_huma_volve/features/auth/login/domain/entity/login_entity.dart';

class LoginModel extends LoginEntity {
  String? accessToken;
  String? refreshToken;

  LoginModel({this.accessToken, this.refreshToken});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }
}
