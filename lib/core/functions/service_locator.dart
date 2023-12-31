import 'package:ecommerce/features/auth/data/data_sources/login_data_source/remote_data_source/login_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/data_sources/sign_up_data_source/remote_data_source/sign_up_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/repositories/login_repositories/login_repo_impl.dart';
import 'package:ecommerce/features/auth/data/repositories/sign_up_repositories/sign_up_repo_impl.dart';
import 'package:ecommerce/features/auth/domain/repositories/login_repositories/login_repo.dart';
import 'package:ecommerce/features/auth/domain/repositories/sign_up_repositories/sign_up_repo.dart';
import 'package:ecommerce/features/auth/domain/use_cases/login_use_cases/fetch_token_use_case.dart';
import 'package:ecommerce/features/auth/domain/use_cases/sign_up_use_cases/check_email_use_case.dart';
import 'package:ecommerce/features/auth/domain/use_cases/sign_up_use_cases/sign_up_use_case.dart';
import 'package:ecommerce/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:ecommerce/features/auth/presentation/manager/sign_up_cubits/check_email_cubit/check_email_cubit.dart';
import 'package:ecommerce/features/auth/presentation/manager/sign_up_cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/features/category_products/data/data_sources/remote_data_source/category_products_remote_data_source.dart';
import 'package:ecommerce/features/category_products/data/repositories/category_products_repo_impl.dart';
import 'package:ecommerce/features/category_products/domain/repositories/category_products_repo.dart';
import 'package:ecommerce/features/category_products/domain/use_cases/fetch_category_products_use_case.dart';
import 'package:ecommerce/features/category_products/presentation/manager/category_products_cubit/category_products_cubit.dart';
import 'package:ecommerce/features/home/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/repositories/home_repo_impl.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repo.dart';
import 'package:ecommerce/features/home/domain/use_cases/fetch_category_use_case.dart';
import 'package:ecommerce/features/home/domain/use_cases/fetch_new_arrivals_use_case.dart';
import 'package:ecommerce/features/home/domain/use_cases/fetch_user_use_case.dart';
import 'package:ecommerce/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:ecommerce/features/home/presentation/manager/new_arrivals_cubit/new_arrivals_cubit.dart';
import 'package:ecommerce/features/home/presentation/manager/user_cubit/user_cubit.dart';
import 'package:ecommerce/features/order/presentation/manager/order_cubit.dart';
import 'package:ecommerce/features/product_details/data/data_sources/remote_data_source/product_details_remote_data_source.dart';
import 'package:ecommerce/features/product_details/data/repositories/product_details_repo_impl.dart';
import 'package:ecommerce/features/product_details/domain/repositories/product_details_repo.dart';
import 'package:ecommerce/features/product_details/domain/use_cases/fetch_product_details_use_case.dart';
import 'package:ecommerce/features/product_details/presentation/manager/fetch_product_details_cubit/fetch_product_details_cubit.dart';
import 'package:ecommerce/features/product_details/presentation/manager/product_color_cubit/product_color_selector_cubit.dart';
import 'package:ecommerce/features/product_details/presentation/manager/product_quantity_cubit/product_quantity_cubit.dart';
import 'package:ecommerce/features/product_details/presentation/manager/shirt_size_selector_cubit/shirt_size_selector_cubit.dart';
import 'package:ecommerce/features/product_details/presentation/manager/shoes_size_selector_cubit/shoes_size_selector_cubit.dart';
import 'package:ecommerce/features/profile/data/data_sources/remote_data_source/profile_remote_data_source.dart';
import 'package:ecommerce/features/profile/data/repositories/profile_repo_impl.dart';
import 'package:ecommerce/features/profile/domain/repositories/profile_repo.dart';
import 'package:ecommerce/features/profile/domain/use_cases/fetch_profile_use_case.dart';
import 'package:ecommerce/features/profile/presentation/manager/profile_cubit.dart';
import 'package:ecommerce/features/root/presentation/manager/bottom_navigation_cubit.dart';
import 'package:ecommerce/features/settings/data/data_sources/remote_data_source/settings_remote_data_source.dart';
import 'package:ecommerce/features/settings/data/repositories/settings_repo_impl.dart';
import 'package:ecommerce/features/settings/domain/repositories/settings_repo.dart';
import 'package:ecommerce/features/settings/domain/use_cases/update_user_use_case.dart';
import 'package:ecommerce/features/settings/presentation/manager/update_user_cubit/update_user_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// Cubit
    // login cubit
    sl.registerFactory<LoginCubit>(() => LoginCubit(sl.call()));

    //signup Cubit
    sl.registerFactory<CheckEmailCubit>(() => CheckEmailCubit(sl.call()));
    sl.registerFactory<SignUpCubit>(() => SignUpCubit(sl.call()));

    //root cubit
    sl.registerFactory<NavigationCubit>(() => NavigationCubit());

    //home cubit
    sl.registerFactory<NewArrivalsCubit>(() => NewArrivalsCubit(sl.call()));
    sl.registerFactory<UserCubit>(() => UserCubit(sl.call()));
    sl.registerFactory<CategoriesCubit>(() => CategoriesCubit(sl.call()));

    //settings cubit
    sl.registerFactory<UpdateUserCubit>(() => UpdateUserCubit(sl.call()));

    //category products cubit
    sl.registerFactory<CategoryProductsCubit>(
        () => CategoryProductsCubit(sl.call()));

    //product details cubit
    sl.registerFactory<FetchProductDetailsCubit>(
        () => FetchProductDetailsCubit(sl()));
    sl.registerFactory<ShirtSizeSelectorCubit>(
        () => ShirtSizeSelectorCubit());
    sl.registerFactory<ShoesSizeSelectorCubit>(
            () => ShoesSizeSelectorCubit());
    sl.registerFactory<ProductColorSelectorCubit>(
            () => ProductColorSelectorCubit());
    sl.registerFactory<ProductQuantityCubit>(() => ProductQuantityCubit());

    //cart cubit
    sl.registerFactory<CartCubit>(() => CartCubit());

    //profile cubit
    sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl.call()));

    //my order cubit
    sl.registerFactory<OrderCubit>(() => OrderCubit());



    //-------------------------------------------------------------------------------------------------//
    ///UseCase
    //login use case
    sl.registerLazySingleton<FetchTokenUseCase>(
        () => FetchTokenUseCase(sl.call()));

    //signup use case
    sl.registerLazySingleton<CheckEmailUseCase>(
        () => CheckEmailUseCase(sl.call()));
    sl.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(sl.call()));

    //home use case
    sl.registerLazySingleton<FetchNewArrivalsUseCase>(
        () => FetchNewArrivalsUseCase(sl.call()));
    sl.registerLazySingleton<FetchUserUseCase>(
        () => FetchUserUseCase(sl.call()));
    sl.registerLazySingleton<FetchCategoryUseCase>(
        () => FetchCategoryUseCase(sl.call()));

    //settings use case
    sl.registerLazySingleton<UpdateUserUseCase>(
        () => UpdateUserUseCase(sl.call()));

    //category products use case
    sl.registerLazySingleton<FetchCategoryProductsUseCase>(
        () => FetchCategoryProductsUseCase(sl.call()));

    //product details use case
    sl.registerLazySingleton<FetchProductDetailsUseCase>(
        () => FetchProductDetailsUseCase(sl.call()));

    //profile use case
    sl.registerLazySingleton<FetchProfileUseCase>(
            () => FetchProfileUseCase(sl.call()));


    //-------------------------------------------------------------------------------------------------//
    ///Repository
    //login repo
    sl.registerLazySingleton<LoginRepo>(
        () => LoginRepoImpl(loginRemoteDataSource: sl.call()));

    //signup repo
    sl.registerLazySingleton<SignUpRepo>(() => SignUpRepoImpl(sl.call()));

    //home repo
    sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(sl.call()));

    //settings repo
    sl.registerLazySingleton<SettingsRepo>(() => SettingsRepoImpl(sl.call()));

    //category products repo
    sl.registerLazySingleton<CategoryProductsRepo>(
        () => CategoryProductsRepoImpl(sl.call()));

    //product details repo
    sl.registerLazySingleton<ProductDetailsRepo>(
        () => ProductDetailsRepoImpl(sl.call()));

    //profile repo
    sl.registerLazySingleton<ProfileRepo>(
            () => ProfileRepoImpl(sl.call()));

    //-------------------------------------------------------------------------------------------------//
    ///DataSource
    //login data source
    sl.registerLazySingleton<LoginRemoteDataSource>(
        () => LoginRemoteDataSourceImpl());

    //signup data source
    sl.registerLazySingleton<SignUpRemoteDataSource>(
        () => SignUpRemoteDataSourceImpl());

    //home data source
    sl.registerLazySingleton<HomeRemoteDataSource>(
        () => HomeRemoteDataSourceImpl());

    //settings data source
    sl.registerLazySingleton<SettingsRemoteDataSource>(
        () => SettingsRemoteDataSourceImpl());

    //category products data source
    sl.registerLazySingleton<CategoryProductsRemoteDataSource>(
        () => CategoryProductsRemoteDataSourceImpl());

    //product details data source
    sl.registerLazySingleton<ProductDetailsRemoteDataSource>(
        () => ProductDetailsRemoteDataSourceImpl());

    //profile data source
    sl.registerLazySingleton<ProfileRemoteDataSource>(
            () => ProfileRemoteDataSourceImpl());
  }
}
