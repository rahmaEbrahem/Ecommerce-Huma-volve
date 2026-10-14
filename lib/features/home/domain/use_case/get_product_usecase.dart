import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failer.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/home_product_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/repository/home_repository.dart';

class GetProductUsecase {
  final HomeRepository homeRepository;
  GetProductUsecase(this.homeRepository);
  Future<Either<Failure, List<HomeProductEntity>>> invoke(int? categoryId) {
    return homeRepository.getProducts(categoryId);
  }
}
