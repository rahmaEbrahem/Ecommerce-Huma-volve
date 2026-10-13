import 'package:ecommerce_app_huma_volve/core/constans/api_endpoints.dart';
import 'package:ecommerce_app_huma_volve/core/dummy_data.dart';
import 'package:ecommerce_app_huma_volve/core/networking/api_client.dart';
import 'package:ecommerce_app_huma_volve/features/home/services/models/category_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/services/models/product_model.dart';

class HomeServies {
  final ApiClient apiClient;
  HomeServies(this.apiClient);
  Future<List<CategoryModel>> getCategory() async {
    final response = await apiClient.dio.get(ApiEndpoints.categoryendpoints);
    final List jsondata = response.data;
    final List<CategoryModel> categories = jsondata
        .map((e) => CategoryModel.fromJson(e))
        .toList();
    return categories;
  }

  Future<List<ProductModel>> getProducts(int? categoryId) async {
    final response = await apiClient.dio.get(
      "${ApiEndpoints.categoryendpoints}/$categoryId/${ApiEndpoints.productsendpoints}",
    );
    final List jsondata = response.data;
    final List<ProductModel> products = jsondata
        .map((e) => ProductModel.fromJson(e))
        .toList();
    return products;
  }
}
