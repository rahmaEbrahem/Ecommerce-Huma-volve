import 'package:ecommerce_app_huma_volve/core/constans/api_endpoints.dart';
import 'package:ecommerce_app_huma_volve/core/networking/api_client.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/data_source/home_remote_data.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/category_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/product_model.dart';

class HomeRemotDataImplementation implements HomeRemoteData {
  final ApiClient apiClient;
  HomeRemotDataImplementation(this.apiClient);
  @override
  Future<List<CategoryModel>> getCategory() async {
    final response = await apiClient.dio.get(ApiEndpoints.categoryendpoints);
    final List jsondata = response.data;
    final List<CategoryModel> categories = jsondata
        .map((e) => CategoryModel.fromJson(e))
        .toList();
    return categories;
  }

  @override
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
