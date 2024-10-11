import 'package:app_my_pham/feature/authentication/controller/login/login_controller.dart';
import 'package:app_my_pham/feature/authentication/screens/Password_configuration/forgot_password.dart';
import 'package:app_my_pham/feature/authentication/screens/sign_up/signup.dart';
import 'package:app_my_pham/navigation_container.dart';
import 'package:app_my_pham/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Form(
          key: controller.signInFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.email,
                validator: (value) => MPValidator.validateEmail(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right_copy),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: (value) => MPValidator.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      labelText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value
                              ? Iconsax.eye_slash_copy
                              : Iconsax.eye_copy))),
                ),
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
                      Obx(
                        () => Checkbox(
                          value: controller.rememberMe.value,
                          activeColor: Colors.blue,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value,
                        ),
                      ),
                      Text(
                        'Remember Me',
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                  TextButton(
                      onPressed: () =>
                          Get.to(() => const ForgotPasswordScreen()),
                      child: const Text('Forget Password?'))
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
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
                    onPressed: () => Get.to(() => const SignupScreen()),
                    child: const Text(
                      'Create Account',
                    )),
              ),
            ],
          )),
    );
  }
}
