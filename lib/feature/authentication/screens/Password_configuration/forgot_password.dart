import 'package:app_my_pham/feature/authentication/screens/Password_configuration/Noti_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot password',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20.0,),
            Text(
              'Don\'t worry! Enter your email and we will send you a password reset link.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 50.0,),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right_copy),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 32.0,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.to(()=> const NotiPasswordScreen()),
                  child: const Text(
                    'Submit',
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
