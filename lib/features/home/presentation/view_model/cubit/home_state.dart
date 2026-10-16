import 'package:ecommerce_app_huma_volve/features/home/data/models/category_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/product_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/home_category_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/home_product_entity.dart';

abstract class HomeState {}

class HomeInitail extends HomeState {}

class Categoriesloading extends HomeState {}

class CategoriesSuccess extends HomeState {
  final List<HomeCategoryEntity> categories;
  CategoriesSuccess(this.categories);
}

class CategoriesError extends HomeState {
  final String errorMassege;
  CategoriesError(this.errorMassege);
}

class Productloading extends HomeState {}

class ProductSuccess extends HomeState {
  final List<HomeProductEntity> products;
  ProductSuccess(this.products);
}

class ProductError extends HomeState {
  final String errorMassege;
  ProductError(this.errorMassege);
}

class ProductLoadingMore extends HomeState {}

class ProductLodingError extends HomeState {
  final String errorMessage;
  ProductLodingError({required this.errorMessage});
}
