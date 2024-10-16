import 'package:app_my_pham/data/firebase_storage_service.dart';
import 'package:app_my_pham/feature/shop/models/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/exceptions/firebase_exceptions.dart';
import '../../utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  ///get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw MPFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw MPPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  // Future<void> uploadDummyData(List<CategoryModel>categories)async{
  //   try {
  //     final storage = Get.put(MPFirebaseStorageService());
  //     ///get imagedata link từ assets
  //     for(var category in categories){
  //       final file = await storage.getImageDataFromAssets(category.image);
  //       ///tải hình và get url
  //       final url = await storage.uploadImageData('Categories', category.name,file);
  //       category.image = url;
  //       await _db.collection('Categories').doc(category.id).set(category.toJson());
  //     }
  //   } on FirebaseException catch (e) {
  //     throw MPFirebaseException(e.code).message;
  //   } on PlatformException catch (e) {
  //     throw MPPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong';
  //   }
  // }
}
