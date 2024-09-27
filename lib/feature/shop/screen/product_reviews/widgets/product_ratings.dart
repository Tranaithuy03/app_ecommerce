import 'package:flutter/material.dart';
class MPRatings extends StatelessWidget {
  const MPRatings({
    super.key, required this.text, required this.value,
  });
  final String text;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1,child: Text(text, style:Theme.of(context).textTheme.bodyMedium,)),
        Expanded(flex: 11,
          child: SizedBox(//giới hạn chiều rộng của thanh
            width: MediaQuery.of(context).size.width*0.5,
            child: LinearProgressIndicator(
              value: value,
              borderRadius: BorderRadius.circular(7),
              valueColor: const AlwaysStoppedAnimation(Colors.blueAccent),
              backgroundColor: Colors.grey.withOpacity(0.3),
              minHeight: 11,
            ),
          ),
        )
      ],
    );
  }
}