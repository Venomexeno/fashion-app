import 'package:ecommerce/features/auth/presentation/widgets/login_page_body.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginPageBody(),
    );
  }
}
