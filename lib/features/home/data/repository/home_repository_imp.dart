import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/error/error_handling.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failer.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/data_source/home_remote_data.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/home_category_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/home_product_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  final HomeRemoteData homeRemoteData;
  HomeRepositoryImp(this.homeRemoteData);
  @override
  Future<Either<Failure, List<HomeCategoryEntity>>> getCategory() async {
    try {
      final categories = await homeRemoteData.getCategory();
      return Right(categories as List<HomeCategoryEntity>);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<HomeProductEntity>>> getProducts(
    int? categoryId, {
    required int offset,
    required int limit,
  }) async {
    try {
      final products = await homeRemoteData.getProducts(
        categoryId,
        offset: offset,
        limit: limit,
      );
      return Right(products as List<HomeProductEntity>);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
