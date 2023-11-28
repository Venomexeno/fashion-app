import 'package:ecommerce/OnGenerateRoute.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/utils/functions/service_locator.dart';
import 'package:ecommerce/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {

  ServiceLocator().init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      designSize: const Size(375, 812),
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider<LoginCubit>(
          create: (context) => sl<LoginCubit>(),
          child: MaterialApp(
            onGenerateRoute: OnGenerateRoute.routes,
            initialRoute: AppRoutes.loginPageRoute,
            title: 'Flutter Demo',
            theme: ThemeData.light().copyWith(
              primaryColor: Colors.black,
              colorScheme: ThemeData().colorScheme.copyWith(
                primary: Colors.black,
              ),
              textTheme:
              GoogleFonts.poppinsTextTheme(ThemeData
                  .light()
                  .textTheme),
            ),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
