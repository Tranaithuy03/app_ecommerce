import 'package:app_my_pham/feature/authentication/screens/login/widgets/login_footer.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //header
              Text('Let\'s create your account',
                  style: Theme.of(context).textTheme.headlineMedium
              ),
              const SizedBox(height: 30,),
              //form
              Form(
                  child: Column(
                   // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: TextFormField(
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.user),
                                labelText: 'First Name'
                            ),
                          )),
                          const SizedBox(width: 15,),
                          Expanded(child: TextFormField(
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.user),
                                labelText: 'Last Name'
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(height: 18,),
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.user_edit),
                            labelText: 'User name'
                        ),
                      ),
                      const SizedBox(height: 18,),
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.direct),
                            labelText: 'E-Mail'
                        ),
                      ),
                      const SizedBox(height: 18,),
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.call),
                            labelText: 'Phone Number'
                        ),
                      ),
                      const SizedBox(height: 18,),
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.password_check),
                            labelText: 'Password',
                            suffixIcon: Icon(Iconsax.eye_slash)
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Row(
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Checkbox(
                              value: true,
                              activeColor: Colors.blue,
                              onChanged: (value) {},
                            ),
                          ),
                          const SizedBox(width: 8.0,),
                          Text.rich(TextSpan(
                            children: [
                              TextSpan(
                                text: 'I agree to ',
                                style: Theme.of(context).textTheme.bodySmall
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: Theme.of(context).textTheme.bodyMedium?.apply(color: Colors.blue,decoration: TextDecoration.underline)
                              ),
                              TextSpan(
                                text: ' and ',
                                style: Theme.of(context).textTheme.bodySmall
                              ),
                              TextSpan(
                                  text: 'Terms of use',
                                  style: Theme.of(context).textTheme.bodyMedium?.apply(color: Colors.blue,decoration: TextDecoration.underline)
                              ),
                            ]
                          ))
                        ],
                      ),
                     const SizedBox(height: 32,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'Create Account',
                            )),
                      ),
                    ],
                  )
              ),
              const SizedBox(height: 32,),
              const DividerFooter()
            ],
          ),
        ),
      ),
    );
  }
}
