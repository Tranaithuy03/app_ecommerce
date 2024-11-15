import 'package:app_my_pham/common/enum.dart';
import 'package:app_my_pham/common/widgets/loaders.dart';
import 'package:app_my_pham/data/product/product_repository.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final isLoading = false.obs;
  final productRepo = Get.put(ProductRepository());

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      ///fetch product
      final products = await productRepo.getFeaturedProducts();
      featuredProducts.assignAll(products);
    } catch (e) {
      MPLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      final products = await productRepo.getAllFeaturedProducts();
      return products;
    } catch (e) {
      MPLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
      return [];
    }
  }

  ///hàm lấy giá tiền nhỏ nhất và cao nhất trong các biến thể để hiển thị, ví dụ như trong shopee có hiển thị giá sản phẩm như 1000- 39999
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    ///neu khong co variations, tra ve simple price or sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      for (var variation in product.productVariations!) {
        //xac dinh gia
        double priceToConsider =
            variation.salePrice > 0 ? variation.salePrice : variation.price;
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      ///neu smallest = largest => return only one price
      if (largestPrice == smallestPrice) {
        return largestPrice.toString();
      } else {
        return '$smallestPriceđ-$largestPriceđ';
      }
    }
  }
  ///hàm tính %
  String? calculateSalePercentage(double originalPrice, double? salePrice){
    if(salePrice == null|| salePrice <=0.0)return null;
    if(originalPrice <=0.0)return null;
    double percentage = ((originalPrice-salePrice)/originalPrice)*100;
    return percentage.toStringAsFixed(0);///hàm lấy n chữ số sau dấu thập phân
  }
  String getProductStockState(int stock){
    return stock>0? 'In Stock': 'Out of Stock';
  }
}
