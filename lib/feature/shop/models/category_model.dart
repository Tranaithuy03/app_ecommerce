import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;
  ///generative constructor
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId =''
});
  static CategoryModel empty()=> CategoryModel(id: '', name: '', image: '', isFeatured: false);
  ///chuyển đổi sang json
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeatured
    };
  }
  ///factory constructor: dùng khi bạn không thực sự cần tạo ra 1 instance mới
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data() != null) {
      final data = documentSnapshot.data();
      return CategoryModel(
          id: documentSnapshot.id,
          name: data!['Name'] ?? '',
          image: data['Image'] ?? '',
          parentId: data['ParentId'] ?? '',
          isFeatured: data['IsFeatured'] ?? false);
    }
    return CategoryModel.empty();
  }
}