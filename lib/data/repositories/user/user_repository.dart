import 'dart:io';

import 'package:app_my_pham/data/repositories/authentication/authentication_repository.dart';
import 'package:app_my_pham/feature/personalization/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;


  ///save data
  Future<void> saveUserRecord(UserModel user)async{
    try{
      await _db.collection('Users').doc(user.id).set(user.toJson());
    }on FirebaseException catch(e){
      throw MPFirebaseException(e.code).message;
    }on FormatException catch(e){
      throw const MPFormatException();
    }on PlatformException catch(e){
      throw MPPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong';
    }
  }
  ///fetchdata
  Future<UserModel> fetchUserData()async{
    try{
      final documentSnapshot = await _db.collection('Users').doc(AuthenticationRepository.instance.authUser!.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      }
      else{
        return UserModel.empty();
      }
    }on FirebaseException catch(e){
      throw MPFirebaseException(e.code).message;
    }on FormatException catch(e){
      throw const MPFormatException();
    }on PlatformException catch(e){
      throw MPPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong';
    }
  }
  Future<void> updateUserData(UserModel updatedUser)async{
    try{
      await _db.collection('Users').doc(updatedUser.id).update(updatedUser.toJson());
    }on FirebaseException catch(e){
      throw MPFirebaseException(e.code).message;
    }on FormatException catch(e){
      throw const MPFormatException();
    }on PlatformException catch(e){
      throw MPPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong';
    }
  }
  Future<void> updateSingleField(Map<String,dynamic> json)async{
    try{
      await _db.collection('Users').doc(AuthenticationRepository.instance.authUser!.uid).update(json);
    }on FirebaseException catch(e){
      throw MPFirebaseException(e.code).message;
    }on FormatException catch(e){
      throw const MPFormatException();
    }on PlatformException catch(e){
      throw MPPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong';
    }
  }
  Future<void> removeUserRecord(String userId)async{
    try{
      await _db.collection('Users').doc(userId).delete();
    }on FirebaseException catch(e){
      throw MPFirebaseException(e.code).message;
    }on FormatException catch(e){
      throw const MPFormatException();
    }on PlatformException catch(e){
      throw MPPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong';
    }
  }
  Future<String> uploadImage(String path, XFile image)async{
    try{
      final ref = FirebaseStorage.instance.ref(path).child(image.name);///tạo tham chiếu tới vị trí path, child dùng để xác định đường dẫn con trong path
      ///ví dụ: path là uploads/images và tên image là photo.png => string là uploads/images/photo.png
      await ref.putFile(File(image.path));///put file ảnh
      final url= await ref.getDownloadURL();///lấy url truy cập tệp đã tải lên
      return url;
    }on FirebaseException catch(e){
      throw MPFirebaseException(e.code).message;
    }on FormatException catch(e){
      throw const MPFormatException();
    }on PlatformException catch(e){
      throw MPPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong';
    }
  }
}