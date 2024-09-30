import 'package:app_my_pham/data/repositories/authentication/authentication_repository.dart';
import 'package:app_my_pham/feature/authentication/controller/signup/verify_email_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => AuthenticationRepository.instance.logout(),
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
                'Verify your email address',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12.0,),
              Text(
                email??'',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12.0,),
              Text(
                'Congratulations! Wait to verify your email address to start shopping.',
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32.0,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.checkEmailVerificationStatus(),
                    child: const Text(
                      'Continue',
                    )),
              ),
              const SizedBox(height: 12.0,),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: ()=> controller.sendEmailVerification(),
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
