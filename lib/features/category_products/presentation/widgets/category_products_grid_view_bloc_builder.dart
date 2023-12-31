import 'package:ecommerce/features/category_products/presentation/manager/category_products_cubit/category_products_cubit.dart';
import 'package:ecommerce/features/category_products/presentation/widgets/category_products_grid_view.dart';
import 'package:ecommerce/features/category_products/presentation/widgets/category_products_loading_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsGridViewBlocBuilder extends StatelessWidget {
  const CategoryProductsGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
      builder: (context, state) {
        if (state is CategoryProductsSuccess) {
          if (state.categoryProducts.isEmpty) {
            return const Center(
              child: Text(
                'Sorry, there is no products yet',
              ),
            );
          } else {
            return CategoryProductsGridView(
                categoryProducts: state.categoryProducts);
          }
        } else if (state is CategoryProductsFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return const CategoryProductsLoadingGridView();
        }
      },
    );
  }
}
