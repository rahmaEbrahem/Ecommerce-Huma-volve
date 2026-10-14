import 'package:ecommerce_app_huma_volve/features/home/data/models/category_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/product_model.dart';

abstract class HomeRemoteData {
  Future<List<CategoryModel>> getCategory();

  Future<List<ProductModel>> getProducts(int? categoryId);
}
