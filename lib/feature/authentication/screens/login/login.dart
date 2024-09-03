import 'package:app_my_pham/feature/authentication/screens/login/widgets/login_footer.dart';
import 'package:app_my_pham/feature/authentication/screens/login/widgets/login_form.dart';
import 'package:app_my_pham/feature/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 56.0, left: 24.0, right: 24.0, bottom: 24.0),
          child: Column(
            children: [
              //header
              const LoginHeader(title: 'Khám phá vũ trụ tỏa hương bằng cách tạo tài khoản!',),
              //form
              const LoginForm(),
              //divide
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(child: Divider(color: Colors.black12,thickness: 0.5,indent: 60,endIndent: 5,)),
                  Text('Or Sign In With', style: Theme.of(context).textTheme.labelMedium,),
                  const Flexible(child: Divider(color: Colors.black12,thickness: 0.5,indent: 5,endIndent: 60,))
                ],
              ),
              const SizedBox(height: 20.0,),
              //footer
              const LoginFooter()
            ],
          ),
        ),
      ),
    );
  }
}



