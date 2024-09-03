import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 56.0, left: 24.0, right: 24.0, bottom: 24.0),
          child: Column(
            children: [
              //header
              Column(
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
                  Text('Khám phá vũ trụ tỏa hương bằng cách tạo tài khoản!',
                      style: Theme.of(context).textTheme.bodyMedium)
                ],
              ),
              //form
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.direct_right_copy),
                            labelText: 'Email',
                          ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              suffixIcon: Icon(Iconsax.eye_slash_copy),
                              labelText: 'Password',
                              prefixIcon: Icon(Iconsax.password_check_copy)),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                  value: true,
                                  activeColor: Colors.blue,
                                  onChanged: (value) {},
                                ),
                                const Text('Remember Me')
                              ],
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text('Forget Password?'))
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                'Sign In',
                              )),
                        ),
                        const SizedBox(
                          height: 18.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                              onPressed: () {},
                              child: const Text(
                                'Create Account',
                              )),
                        ),
                      ],
                    )
                ),
              ),
              //divide
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(child: Divider(color: Colors.black12,thickness: 0.5,indent: 60,endIndent: 5,)),
                  Text('Or Sign In With', style: Theme.of(context).textTheme.labelMedium,),
                  const Flexible(child: Divider(color: Colors.black12,thickness: 0.5,indent: 5,endIndent: 60,))
                ],
              ),
              const SizedBox(height: 20.0,),
              //footer
              Row(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
