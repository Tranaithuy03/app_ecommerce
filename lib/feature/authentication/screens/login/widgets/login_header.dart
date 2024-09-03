import 'package:flutter/material.dart';
class LoginHeader extends StatelessWidget {
  final String title;
  const LoginHeader({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(
            height: 150, image: AssetImage('assets/logos/logo.png')),
        Text(
          'Welcome',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(title,
            style: Theme.of(context).textTheme.bodyMedium)
      ],
    );
  }
}
