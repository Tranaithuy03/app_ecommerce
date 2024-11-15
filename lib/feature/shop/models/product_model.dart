import 'package:app_my_pham/feature/shop/models/brand_model.dart';
import 'package:app_my_pham/feature/shop/models/product_attribute_model.dart';
import 'package:app_my_pham/feature/shop/models/product_variation_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({required this.id,
    required this.stock,
    required this.title,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.salePrice = 0.0,
    this.description,
    this.isFeatured,
    this.images,
    this.categoryId,
    this.productAttributes,
    this.productVariations});

  static ProductModel empty() =>
      ProductModel(id: '',
          stock: 0,
          title: '',
          price: 0,
          thumbnail: '',
          productType: '');

  toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Thumbnail': thumbnail,
      'Stock': stock,
      'Price': price,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'Images': images ?? [],
      'CategoryId': categoryId,
      'Brand': brand!.toJson(),
      'Description': description,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null ? productAttributes!.map((
          e) => e.toJson()).toList() : [],
      'ProductVariations': productVariations != null ? productVariations!.map((
          e) => e.toJson()).toList() : [],
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot){
    if (documentSnapshot.data() == null) return ProductModel.empty();
    final data = documentSnapshot.data()!;
    return ProductModel(
      id: documentSnapshot.id,
      stock: data['Stock'] ?? 0,
      title: data['Title'] ?? '',
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      productType: data['ProductType'] ?? '',
      sku: data['SKU'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) =>
          ProductAttributeModel.fromJson(e)).toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>).map((e) =>
          ProductVariationModel.fromJson(e)).toList(),
    );
  }

  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?>documentSnapshot){
    final data = documentSnapshot.data() as Map<String, dynamic>;
    return ProductModel(id: documentSnapshot.id,
        stock: data['Stock'] ?? 0,
        title: data['Title'] ?? '',
        price: double.parse((data['Price'] ?? 0.0).toString()),
    salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
    thumbnail: data['Thumbnail'] ?? '',
    productType: data['ProductType'] ?? '',
    sku: data['SKU'] ?? '',
    isFeatured: data['IsFeatured'] ?? false,
    categoryId: data['CategoryId'] ?? '',
    description: data['Description'] ?? '',
    brand: BrandModel.fromJson(data['Brand']),
    images: data['Images'] != null ? List<String>.from(data['Images']) : [],
    productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) =>
    ProductAttributeModel.fromJson(e)).toList(),
    productVariations: (data['ProductVariations'] as List<dynamic>).map((e) =>
    ProductVariationModel.fromJson(e)).toList(),);
  }
}
