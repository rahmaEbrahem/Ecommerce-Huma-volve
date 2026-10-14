import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/error/error_handling.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failer.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/data/data_source/sign_remote_data.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/data/models/signup_req_model.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/domain/entity/sign_up_entity.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/domain/repository/sign_up_repository.dart';

class SignRepoImp implements SignUpRepository {
  final SignRemoteData signRemoteData;
  SignRepoImp(this.signRemoteData);
  @override
  Future<Either<Failure, SignUpEntity>> signUp(
    SignUpEntity signupEntity,
  ) async {
    try {
      final requestModel = SignupReqModel(
        email: signupEntity.email,
        name: signupEntity.name,
        password: signupEntity.password,
      );

      final data = await signRemoteData.signUp(requestModel);
      return Right(data);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
