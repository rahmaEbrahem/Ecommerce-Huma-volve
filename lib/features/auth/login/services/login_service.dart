import 'package:ecommerce_app_huma_volve/core/constans/api_endpoints.dart';
import 'package:ecommerce_app_huma_volve/core/networking/api_client.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/models/login_model.dart';

class LoginService {
  ApiClient apiClient;
  LoginService(this.apiClient);
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
