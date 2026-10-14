import 'package:ecommerce_app_huma_volve/features/home/data/models/category_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/home_category_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/home_product_entity.dart';

class ProductModel extends HomeProductEntity {
  ProductModel({
    super.id,
    super.title,
    super.slug,
    super.price,
    super.description,
    super.category,
    super.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      slug: json['slug'] ?? "",
      price: json['price'] ?? 0,
      description: json['description'] ?? "",
      category: json['category'] != null
          ? CategoryModel.fromJson(json['category'])
          : const HomeCategoryEntity(),
      images: (json['images'] as List<dynamic>?)?.cast<String>() ?? const [],
    );
  }
}
