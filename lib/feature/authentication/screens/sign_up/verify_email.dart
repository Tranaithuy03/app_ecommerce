import 'package:app_my_pham/feature/authentication/screens/login/login.dart';
import 'package:app_my_pham/feature/authentication/screens/sign_up/verify_done.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                'Verify your email address',
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
                'Congratulations! Wait to verify your email address to start shopping.',
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32.0,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(()=> const VerifyDoneScreen()),
                    child: const Text(
                      'Continue',
                    )),
              ),
              const SizedBox(height: 12.0,),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {},
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
