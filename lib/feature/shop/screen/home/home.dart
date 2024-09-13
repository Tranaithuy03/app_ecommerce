import 'package:app_my_pham/feature/shop/screen/home/widgets/appbar.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/curved_edges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MPPrimaryHeaderContainer(
              child: Column(
                children: [
                  MPCustomAppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Have a good day!',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(color: Colors.white),
                        ),
                        Text(
                          'Ms.Thuy',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .apply(color: Colors.white),
                        ),
                      ],
                    ),
                    actions: [
                      MPCartCounterIcon(number: '10',onPressed: () {},colorIcon: Colors.white,)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MPCartCounterIcon extends StatelessWidget {
  const MPCartCounterIcon({
    super.key, required this.number, required this.onPressed, required this.colorIcon,
  });
  final String number;
  final VoidCallback onPressed;
  final Color colorIcon;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      IconButton(
          onPressed: onPressed,
          icon: Icon(
            Iconsax.shopping_bag_copy,
            color: colorIcon,
          )),
      Positioned(
        right: 0,
        child: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(100)
          ),
          child: Center(child: Text(number, style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.white, fontSizeFactor: 1),)),
        ),
      )
    ]);
  }
}

class MPPrimaryHeaderContainer extends StatelessWidget {
  const MPPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MPCustomCurvedEdges(),
      child: Container(
        color: Colors.blueAccent,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              const Positioned(
                top: -150,
                right: -250,
                child: CircularContainer(),
              ),
              const Positioned(
                top: 100,
                right: -300,
                child: CircularContainer(),
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(400), color: Colors.white12),
    );
  }
}
