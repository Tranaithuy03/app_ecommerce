import 'package:app_my_pham/feature/authentication/controller/signup/signup_controller.dart';
import 'package:app_my_pham/feature/authentication/screens/login/widgets/login_footer.dart';
import 'package:app_my_pham/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //header
              Text('Let\'s create your account',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(
                height: 30,
              ),
              //form
              const MPFormSignUp(),
              const SizedBox(
                height: 32,
              ),
              const DividerFooter()
            ],
          ),
        ),
      ),
    );
  }
}

class MPFormSignUp extends StatelessWidget {
  const MPFormSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
        key: controller.signupFormKey,
        //kiểm soát trạng thái của form, dùng xác định duy nhất từng widget
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  validator: (value) =>
                      MPValidator.validateEmptyText(value, 'First Name'),
                  controller: controller.firstName,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user), labelText: 'First Name'),
                )),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      MPValidator.validateEmptyText(value, 'Last Name'),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user), labelText: 'Last Name'),
                )),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            TextFormField(
              controller: controller.userName,
              validator: (value) =>
                  MPValidator.validateEmptyText(value, 'User Name'),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user_edit), labelText: 'User name'),
            ),
            const SizedBox(
              height: 18,
            ),
            TextFormField(
              controller: controller.email,
              validator: (value) => MPValidator.validateEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct), labelText: 'E-Mail'),
            ),
            const SizedBox(
              height: 18,
            ),
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => MPValidator.validatePhoneNumber(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.call), labelText: 'Phone Number'),
            ),
            const SizedBox(
              height: 18,
            ),
            Obx(() => TextFormField(
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
                )),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Obx(
                    ()=> Checkbox(
                      value: controller.privacyPolicy.value,
                      activeColor: Colors.blue,
                      onChanged: (value)=> controller.privacyPolicy.value =!controller.privacyPolicy.value,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: 'I agree to ',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: 'Privacy Policy',
                      style: Theme.of(context).textTheme.bodyMedium?.apply(
                          color: Colors.blue,
                          decoration: TextDecoration.underline)),
                  TextSpan(
                      text: ' and ',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: 'Terms of use',
                      style: Theme.of(context).textTheme.bodyMedium?.apply(
                          color: Colors.blue,
                          decoration: TextDecoration.underline)),
                ]))
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child: const Text(
                    'Create Account',
                  )),
            ),
          ],
        ));
  }
}
