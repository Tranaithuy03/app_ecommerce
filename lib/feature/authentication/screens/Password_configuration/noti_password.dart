import 'package:app_my_pham/feature/authentication/controller/forget_password/forget_password_controller.dart';
import 'package:app_my_pham/feature/authentication/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class NotiPasswordScreen extends StatelessWidget {
  const NotiPasswordScreen({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => Get.to(()=> const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Image(
                  width: MediaQuery.of(context).size.width* 0.6,
                  image: const AssetImage('assets/images/verify/verify_email.png')
              ),
              const SizedBox(height: 32.0,),
              Text(
                'Password Reset Link Has been sent',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12.0,),
              Text(
                'supportAT@gm.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12.0,),
              Text(
                'Your account security is our priority! We\'ve sent you a password reset link to safety change your password and keep your account protected',
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32.0,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(()=> const LoginScreen()),
                    child: const Text(
                      'Done',
                    )),
              ),
              const SizedBox(height: 12.0,),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: ()=> ForgetPasswordController.instance.resendPasswordResetEmail(email),
                    child: const Text(
                      'Resend email',
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
