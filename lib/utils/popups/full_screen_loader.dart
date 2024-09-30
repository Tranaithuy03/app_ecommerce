import 'package:app_my_pham/common/widgets/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MPFullScreenLoader{
  static void openLoadingDialog (String text, String animation){
    showDialog(
        context: Get.overlayContext!,//trả về context của overlay, cho phép widget khác hiển thị trên màn hình
        barrierDismissible: false,// không thể tắt dialog bằng cách nhấp ra bên ngoài
        builder: (_)=> PopScope( // dùng để quản lý việc điều hướng back, ví dụ chọn quay lại sẽ hiện 1 dialog để chọn liệu có muốn back thiệt ko
          canPop: false,//vô hiệu hóa nút back
          child: Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 250,),
                MPAnimationLoaderWidget(text: text, animation: animation)
              ],
            ),
          ),
        )
    );
  }
  //dừng mở cái loading dialog hiện tại
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}