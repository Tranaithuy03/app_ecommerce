import 'package:flutter/material.dart';
class VerifyDoneScreen extends StatelessWidget {
  const VerifyDoneScreen({super.key, this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image(
                width: MediaQuery.of(context).size.width* 0.6,
                image: const AssetImage('assets/images/verify/verify_done.png')
            ),
            const SizedBox(height: 32.0,),
            Text(
              'Your account successfully created!',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0,),
            Text(
              'Welcome to AT! Your account is created. Let\'s enjoy!',
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32.0,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(
                    'Continue',
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
