import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCount;

  BrandModel(
      {required this.id, required this.name, required this.image, this.isFeatured, this.productCount});
  static BrandModel empty()=> BrandModel(id: '', name: '', image: '');

  toJson(){
    return{
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductsCount': productCount,
      'IsFeatured': isFeatured
    };
  }
  factory BrandModel.fromJson(Map<String,dynamic>document){
    final data = document;
    if(data.isEmpty) return BrandModel.empty();
    return BrandModel(id: data['Id'??''],name: data['Name'??''], image: data['Image'??'']);
  }
  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>>document){
    if(document.data()!=null){
      final data = document.data()!;
      return BrandModel(id: data['Id'??''],name: data['Name'??''], image: data['Image'??'']);
    }
    return BrandModel.empty();
  }
}