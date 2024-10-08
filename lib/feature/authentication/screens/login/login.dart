import 'package:app_my_pham/feature/authentication/screens/login/widgets/login_footer.dart';
import 'package:app_my_pham/feature/authentication/screens/login/widgets/login_form.dart';
import 'package:app_my_pham/feature/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: 56.0, left: 24.0, right: 24.0, bottom: 24.0),
          child: Column(
            children: [
              //header
              LoginHeader(title: 'Khám phá vũ trụ tỏa hương bằng cách tạo tài khoản!',),
              //form
              LoginForm(),
              //divide
              SizedBox(height: 20.0,),
              //footer
              DividerFooter()
            ],
          ),
        ),
      ),
    );
  }
}



