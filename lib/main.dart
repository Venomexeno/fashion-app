import 'package:ecommerce/OnGenerateRoute.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
        return MaterialApp(
          onGenerateRoute: OnGenerateRoute.routes,
          initialRoute: AppRoutes.authPageRoute,
          title: 'Flutter Demo',
          theme: ThemeData.light().copyWith(
            primaryColor: Colors.black,
            colorScheme: ThemeData().colorScheme.copyWith(
                  primary: Colors.black,
                ),
            textTheme:
                GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
