import 'package:ecommerce_app_huma_volve/features/home/presentation/view_model/cubit/home_state.dart';
import 'package:ecommerce_app_huma_volve/features/home/services/home_servies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeServies homeServies;
  HomeCubit(this.homeServies) : super(HomeInitail());

  void loadHomeData() async {
    emit(Categoriesloading());
    try {
      final categories = await homeServies.getCategory();

      emit(CategoriesSuccess(categories));
      emit(Productloading());
      final products = await homeServies.getProducts(categories[0].id);
      emit(ProductSuccess(products));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }
}
