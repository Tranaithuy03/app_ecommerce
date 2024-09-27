import 'package:flutter/material.dart';

import '../../../../../common/widgets/rounded_container.dart';
class MPAddress extends StatelessWidget {
  const MPAddress({
    super.key, required this.isSelected,
  });
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return MPRoundedContainer(
      margin: const EdgeInsets.only(bottom: 16.0),
      width: double.infinity,
      showBorder: true,
      backgroundColor: isSelected? Colors.blueAccent.withOpacity(0.56): Colors.transparent,
      borderColor: isSelected? Colors.transparent: Colors.grey,
      child: Stack(
        children: [
          Positioned(
              top: 5,
              right: 5,
              child: Icon(isSelected?Icons.check_circle:null, color: isSelected?Colors.black: null,)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('AT đây nè', style: Theme.of(context).textTheme.titleLarge,maxLines: 1,overflow: TextOverflow.ellipsis,),
                const SizedBox(height: 4.0,),
                const Text('+031552255', softWrap: true,),
                const SizedBox(height: 4.0,),
                const Text('KTX khu A, đường Tạ Quang Bửu, Thủ Đức, Thành Phố Hồ Chí Minh', softWrap: true,),
              ],
            ),
          )
        ],
      ),
    );
  }
}