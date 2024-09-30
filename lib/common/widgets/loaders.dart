import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class MPLoaders{
  static warningSnackBar({required title, message =''}){
    Get.snackbar(
      //thanh thong bao xuat hien
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2_copy,color: Colors.white,)
    );
  }
  static errorSnackBar({required title, message =''}){
    Get.snackbar(
      //thanh thong bao xuat hien
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2_copy,color: Colors.white,)
    );
  }
  static successSnackBar({required title, message ='',duration=3}){
    Get.snackbar(
      //thanh thong bao xuat hien
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.blue,
      snackPosition: SnackPosition.BOTTOM,
      duration:  Duration(seconds: duration),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.check_copy,color: Colors.white,)
    );
  }

}