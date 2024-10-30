import 'package:app_my_pham/feature/shop/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/exceptions/firebase_exceptions.dart';
import '../../utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController{
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  ///get limited featured products
  Future<List<ProductModel>> getFeaturedProducts()async{
    try{
      final snapshot =await  _db.collection('Products').where('IsFeatured',isEqualTo: true).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw MPFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw MPPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}