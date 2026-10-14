import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failer.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/domain/entity/login_entity.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/domain/repository/login_repository.dart';

class LoginUsecase {
  final LoginRepository loginRepository;
  LoginUsecase(this.loginRepository);

  Future<Either<Failure, LoginEntity>> invoke({
    required String email,
    required String password,
  }) {
    return loginRepository.login(email: email, password: password);
  }
}
