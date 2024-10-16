import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/exceptions/firebase_exceptions.dart';
import '../utils/exceptions/format_exceptions.dart';
import '../utils/exceptions/platform_exceptions.dart';

class MPFirebaseStorageService extends GetxController {
  static MPFirebaseStorageService get instance => Get.find();
  final _storage = FirebaseStorage.instance;

  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      ///rootBundle cung cap quyen truy cap den tai nguyen trong assets. Ket qua tra ve 1 object ByteData chua du lieu duoi dang byte
      final imageData = byteData.buffer.asUint8List(
          byteData.offsetInBytes, byteData.lengthInBytes);///buffer trả về đối tương đại diện cho bộ đệm cơ bản chứa các byte
      ///chuyển bytebuffer thành Uint8List, bắt đầu đọc từ bộ đệm, chiều dài dữ liệu cần đọc
        return imageData;
    }catch(e){
      throw 'Error loading image data: $e';
    }
  }
  Future<String> uploadImageFile(String path, XFile image)async{
    try{
      final ref = _storage.ref(path).child(image.name);///tạo tham chiếu tới vị trí path, child dùng để xác định đường dẫn con trong path
      await ref.putFile(File(image.path));///put file ảnh
      final url= await ref.getDownloadURL();///lấy url truy cập tệp đã tải lên
      return url;
    }catch(e){
      if(e is FirebaseException){
        throw MPFirebaseException(e.code).message;
      }
      else if( e is SocketException){
        throw'Network Error: ${e.message}';
      }else if(e is PlatformException){
        throw MPPlatformException(e.code).message;
      }else{
        throw 'Something went wrong';
      }
    }
  }
  Future<String> uploadImageData(String path, String name,Uint8List image)async{
    try{
      final ref = _storage.ref(path).child(name);///tạo tham chiếu tới vị trí path, child dùng để xác định đường dẫn con trong path
      await ref.putData(image);///put data
      final url= await ref.getDownloadURL();///lấy url truy cập tệp đã tải lên
      return url;
    }catch(e){
      if(e is FirebaseException){
        throw MPFirebaseException(e.code).message;
      }
      else if( e is SocketException){
        throw'Network Error: ${e.message}';
      }else if(e is PlatformException){
        throw MPPlatformException(e.code).message;
      }else{
        throw 'Something went wrong';
      }
    }
  }

}