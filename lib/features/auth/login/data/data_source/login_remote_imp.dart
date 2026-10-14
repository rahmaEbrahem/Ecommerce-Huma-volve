import 'package:ecommerce_app_huma_volve/core/constans/api_endpoints.dart';
import 'package:ecommerce_app_huma_volve/core/networking/api_client.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/data/data_source/login_remote_data.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/data/models/login_model.dart';

class LoginRemoteImp implements LoginRemoteData {
  final ApiClient apiClient;
  LoginRemoteImp(this.apiClient);
  @override
  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    final response = await apiClient.dio.post(
      ApiEndpoints.loginendpoints,
      data: {"email": email, "password": password},
    );
    final Map<String, dynamic> data = response.data;
    final modeldata = LoginModel.fromJson(data);

    return modeldata;
  }
}
