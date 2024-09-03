import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black26),
          ),
          child: IconButton(
            onPressed: (){},
            icon: Image.asset('assets/logos/logo_google.jpg', width: 14.0,height: 14.0,),
          ),
        ),
        const SizedBox(width: 15.0,),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black26),
          ),
          child: IconButton(
            onPressed: (){},
            icon: Image.asset('assets/logos/logo_facebook.jpg', width: 14.0,height: 14.0,),
          ),
        )
      ],
    );
  }
}
