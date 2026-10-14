import 'package:ecommerce_app_huma_volve/features/auth/sign_up/data/models/signup_req_model.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/data/models/signup_res_model.dart';

abstract class SignRemoteData {
  Future<SignupResModel> signUp(SignupReqModel signupReqModel);
}
