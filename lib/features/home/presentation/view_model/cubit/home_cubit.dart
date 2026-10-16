import 'package:ecommerce_app_huma_volve/features/home/domain/entities/home_product_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/use_case/get_categories_usecase.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/use_case/get_product_usecase.dart';
import 'package:ecommerce_app_huma_volve/features/home/presentation/view_model/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCategoriesUsecase getCategoriesUsecase;
  final GetProductUsecase getProductUsecase;
  final int limit = 10;
  int offset = 0;

  bool loadingMore = false;
  bool hasmore = true;
  int? selectedCaregory;
  final List<HomeProductEntity> _products = [];
  HomeCubit({
    required this.getCategoriesUsecase,
    required this.getProductUsecase,
  }) : super(HomeInitail());

  void loadHomeData() async {
    int categoryId = 0;
    emit(Categoriesloading());

    final categories = await getCategoriesUsecase.invoke();
    categories.fold(
      (failure) {
        emit(CategoriesError(failure.failureMessage));
      },
      (categories) {
        categoryId = categories[0].id;
        emit(CategoriesSuccess(categories));
      },
    );

    emit(Productloading());
    final products = await getProductUsecase.invoke(categoryId);
    products.fold(
      (failure) {
        emit(ProductError(failure.failureMessage));
      },
      (products) {
        emit(ProductSuccess(products));
      },
    );
  }

  void getProductsByCategoryId(int id) async {
    hasmore = true;
    _products.clear;
    emit(Productloading());
    final products = await getProductUsecase.invoke(
      id,
      limit: limit,
      offset: offset,
    );
    products.fold(
      (failure) {
        emit(ProductError(failure.failureMessage));
      },
      (products) {
        products.addAll(products);
        offset = products.length;
        if (products.length < limit) {
          hasmore = false;
        }
        selectedCaregory = id;
        emit(ProductSuccess(List.from(products)));
      },
    );
  }

  Future<void> loadMoreProducts() async {
    if (loadingMore || hasmore) return;
    isloadingMore = true;
    emit(ProductLoadingMore());
    final result = await getProductUsecase.invoke(
      selectedCaregory,
      limit: limit,
      offset: offset,
    );
    result.fold(
      (failure) {
        emit(ProductLodingError(errorMessage: failure.failureMessage));
      },
      (newProducts) {
        _products.addAll(newProducts);
        offset = newProducts.length;
        if (newProducts.length < limit) {
          hasmore = false;
        }
        emit(ProductSuccess(_products));
      },
    );
  }
}
