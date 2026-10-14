import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failer.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/domain/entity/sign_up_entity.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/domain/repository/sign_up_repository.dart';

class SignUpUsecase {
  final SignUpRepository signUpRepository;
  SignUpUsecase(this.signUpRepository);

  Future<Either<Failure, SignUpEntity>> invoke(SignUpEntity signupEntity) {
    return signUpRepository.signUp(signupEntity);
  }
}
