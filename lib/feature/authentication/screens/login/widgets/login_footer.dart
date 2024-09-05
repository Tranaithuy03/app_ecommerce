import 'package:flutter/material.dart';

class DividerFooter extends StatelessWidget {
  const DividerFooter({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(child: Divider(color: Colors.black12,thickness: 0.5,indent: 60,endIndent: 5,)),
        Text('Or Sign In With', style: Theme.of(context).textTheme.labelMedium,),
        const Flexible(child: Divider(color: Colors.black12,thickness: 0.5,indent: 5,endIndent: 60,))
      ],
    ),
    const SizedBox(height: 20.0,),
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
      ]),
    ]);
  }
}
