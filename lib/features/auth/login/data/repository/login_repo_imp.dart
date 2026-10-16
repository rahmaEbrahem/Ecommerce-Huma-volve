import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/error/error_handling.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failer.dart';
import 'package:ecommerce_app_huma_volve/core/secure_storage/secure_storage.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/data/data_source/login_remote_data.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/domain/entity/login_entity.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/domain/repository/login_repository.dart';

class LoginRepoImp implements LoginRepository {
  final LoginRemoteData loginRemoteData;
  LoginRepoImp(this.loginRemoteData);
  @override
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final data = await loginRemoteData.login(
        email: email,
        password: password,
      );
      await SecureStorage.saveAccessToken(data.accessToken);
      await SecureStorage.refreshToken(data.refreshToken);
      return Right(data);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
