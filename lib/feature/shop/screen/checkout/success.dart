import 'package:app_my_pham/navigation_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Image(
                image:
                const AssetImage('assets/images/noti/payment_success.png'),
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.6,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.4,
              ),
              Text('Payment Success!', style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: 16,),
              Text('Your items will be shipped soon', style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: 32,),
              SizedBox(
                width: double.infinity,
                  child: ElevatedButton(onPressed: ()=> Get.to(()=>const NavigationContainer()), child: const Text('Continue')))
            ],
          ),
        ),
      ),
    );
  }
}
