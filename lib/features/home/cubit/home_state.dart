import 'package:ecommerce_app_huma_volve/features/home/services/models/category_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/services/models/product_model.dart';

abstract class HomeState {}

class HomeInitail extends HomeState {}

class Categoriesloading extends HomeState {}

class CategoriesSuccess extends HomeState {
  final List<CategoryModel> categories;
  CategoriesSuccess(this.categories);
}

class CategoriesError extends HomeState {
  final String errorMassege;
  CategoriesError(this.errorMassege);
}

class Productloading extends HomeState {}

class ProductSuccess extends HomeState {
  final List<ProductModel> products;
  ProductSuccess(this.products);
}

class ProductError extends HomeState {
  final String errorMassege;
  ProductError(this.errorMassege);
}
