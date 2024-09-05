import 'package:app_my_pham/feature/authentication/screens/sign_up/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right_copy),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    suffixIcon: Icon(Iconsax.eye_slash_copy),
                    labelText: 'Password',
                    prefixIcon: Icon(Iconsax.password_check_copy)),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                        value: true,
                        activeColor: Colors.blue,
                        onChanged: (value) {},
                      ),
                      const Text('Remember Me')
                    ],
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Forget Password?'))
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign In',
                    )),
              ),
              const SizedBox(
                height: 18.0,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(()=> const SignupScreen()),
                    child: const Text(
                      'Create Account',
                    )),
              ),
            ],
          )
      ),
    );
  }
}