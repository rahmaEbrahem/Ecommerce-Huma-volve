import 'package:ecommerce_app_huma_volve/core/constans/api_endpoints.dart';
import 'package:ecommerce_app_huma_volve/core/networking/api_client.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/models/signup_req_model.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/models/signup_res_model.dart';

class SignupServices {
  ApiClient apiClient;
  SignupServices(this.apiClient);
  Future<SignupResModel> signUp(SignupReqModel signupReqModel) async {
    final response = await apiClient.dio.post(
      ApiEndpoints.signupendpoints,
      data: {
        "email": signupReqModel.email,
        "name": signupReqModel.name,
        "password": signupReqModel.password,
        "avatar": "https://api.lorem.space/image/face?w=640&h=480",
      },
    );
    final data = response.data;
    final dartData = SignupResModel.fromJson(data);
    return dartData;
  }
}
