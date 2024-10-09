import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MPAnimationLoaderWidget extends StatelessWidget {
  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  const MPAnimationLoaderWidget({super.key,
    required this.text,
    required this.animation,
    this.showAction=false,
    this.actionText,
    this.onActionPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: MediaQuery// hiển thị animation file json
              .of(context)
              .size
              .width * 0.8),
          const SizedBox(height: 24,),
          Text(
            text,
            style: Theme
                .of(context)
                .textTheme
                .bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24,),
          showAction ?
          SizedBox(
            width: 250,
            child: OutlinedButton(
                onPressed: onActionPressed,
                style: OutlinedButton.styleFrom(backgroundColor: Colors.black87),
                child: Text(
                  actionText!,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: Colors.white70),
                )),
          ): const SizedBox()
        ],
      ),
    );
  }
}
