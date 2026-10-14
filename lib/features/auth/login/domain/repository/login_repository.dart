import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failer.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/domain/entity/login_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  });
}
