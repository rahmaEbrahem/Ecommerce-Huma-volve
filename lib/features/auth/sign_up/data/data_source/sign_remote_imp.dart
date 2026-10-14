import 'package:ecommerce_app_huma_volve/core/constans/api_endpoints.dart';
import 'package:ecommerce_app_huma_volve/core/networking/api_client.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/data/data_source/sign_remote_data.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/data/models/signup_req_model.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/data/models/signup_res_model.dart';

class SignRemoteImp implements SignRemoteData {
  final ApiClient apiClient;
  SignRemoteImp(this.apiClient);
  @override
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
