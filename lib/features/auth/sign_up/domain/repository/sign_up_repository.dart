import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failer.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/domain/entity/sign_up_entity.dart';

abstract class SignUpRepository {
  Future<Either<Failure, SignUpEntity>> signUp(SignUpEntity signupEntity);
}
