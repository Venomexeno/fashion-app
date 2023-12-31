import 'package:ecommerce/core/functions/service_locator.dart';
import 'package:ecommerce/core/utils/cache_helper.dart';
import 'package:ecommerce/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:ecommerce/features/home/presentation/manager/new_arrivals_cubit/new_arrivals_cubit.dart';
import 'package:ecommerce/features/home/presentation/manager/user_cubit/user_cubit.dart';
import 'package:ecommerce/features/home/presentation/pages/home_page.dart';
import 'package:ecommerce/features/order/presentation/pages/order_page.dart';
import 'package:ecommerce/features/profile/presentation/manager/profile_cubit.dart';
import 'package:ecommerce/features/profile/presentation/pages/profile_page.dart';
import 'package:ecommerce/features/root/presentation/manager/bottom_navigation_cubit.dart';
import 'package:ecommerce/features/root/presentation/widgets/bottom_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootPage extends StatelessWidget {
  RootPage({
    super.key,
  });

  final String token = CacheHelper.getData(key: 'token');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarScreen(
        icons: const [
          Icons.home,
          Icons.shopping_cart,
          Icons.person,
        ],
        screens: [
          MultiBlocProvider(
            providers: [
              BlocProvider<UserCubit>(
                  create: (context) =>
                      sl<UserCubit>()..fetchUser(token: token)),
              BlocProvider<NewArrivalsCubit>(
                  create: (context) =>
                      sl<NewArrivalsCubit>()..fetchNewArrivals()),
              BlocProvider<CategoriesCubit>(
                  create: (context) => sl<CategoriesCubit>()),
            ],
            child: const HomePage(),
          ),
          const OrderPage(),
          BlocProvider<ProfileCubit>(
            create: (context) => sl<ProfileCubit>()..fetchProfile(token: token),
            child: const ProfilePage(),
          ),
        ],
        screenNames: const [
          'Home',
          'Cart',
          'Profile',
        ],
        cubit: context.read<NavigationCubit>(),
      ),
    );
  }
}
