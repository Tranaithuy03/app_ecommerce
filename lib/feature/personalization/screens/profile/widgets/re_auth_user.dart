import 'package:app_my_pham/feature/personalization/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authenticate User'),),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: controller.reAuthFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.verifyEmail,
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
                  controller: controller.verifyPassword,
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: ()=> controller.reAuthenticateEmailAndPassword(),
                    child: const Text(
                      'Verify',
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
