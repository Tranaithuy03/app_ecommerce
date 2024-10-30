import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel{
  String image;
  String targetScreen;
  bool active;
  ///generative constructor
  BannerModel({
    required this.image,
    required this.active,
    required this.targetScreen
  });
  static BannerModel empty()=> BannerModel(image: '', active: false, targetScreen: '');
  ///chuyển đổi sang json
  Map<String, dynamic> toJson() {
    return {
      'Image': image,
      'TargetScreen': targetScreen,
      'Active': active
    };
  }
  ///factory constructor: dùng khi bạn không thực sự cần tạo ra 1 instance mới
  factory BannerModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data() != null) {
      final data = documentSnapshot.data();
      return BannerModel(
          image: data!['Image'] ?? '',
          targetScreen: data['TargetScreen'] ?? '',
          active: data['Active'] ?? false);
    }
    return BannerModel.empty();
  }
}