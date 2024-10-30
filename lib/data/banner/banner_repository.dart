import 'package:app_my_pham/feature/shop/models/banner_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/exceptions/firebase_exceptions.dart';
import '../../utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  ///get all categories
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final snapshot = await _db.collection('Banners').where('Active',isEqualTo: true).get();
      final list = snapshot.docs.map((document) =>
          BannerModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw MPFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw MPPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}