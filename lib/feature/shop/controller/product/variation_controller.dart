import 'package:app_my_pham/feature/shop/controller/product/image_controller.dart';
import 'package:app_my_pham/feature/shop/models/product_model.dart';
import 'package:app_my_pham/feature/shop/models/product_variation_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  ///selected attribute and variation
  ///ví dụ: sp có biến thể size:M và color: red
  ///Lần đầu bấm chọn attribute red=> Name: color và value = red
  ///khi đó map selectedAttributes sẽ có key-value đầu là color:red
  ///tìm trong biến thể của sp không tìm thấy biến thể nào chỉ có thuộc tính red (vì hiện tại chưa bấm chọn size) => trả về empty
  ///tương tự khi ấn chọn tiếp thuộc tính size M => tìm thấy biến thể =>....
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    ///khi 1 attribute được chọn, thêm nó vào selectedAttributes
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;
    final selectedVariation = product.productVariations!.firstWhere(
      (variation) =>
          _isSameAttributeValues(variation.attributeValues, selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );
    if (selectedVariation.image.isNotEmpty) {
      ImageController.instance.selectedProductImage.value =
          selectedVariation.image;
    }
    this.selectedVariation.value = selectedVariation;
    getProductVariationStockStatus();
  }

  //check if selected matches any variation attributes
  ///nếu số lượng biến thể với số lượng thuộc tính đã chọn khác nhau => false
  ///nếu trong biến thể có giá trị nào khác với thuộc tính đã chọn => false
  ///Ví dụ chọn cặp biến thể red-size M nhưng sản phẩm chỉ có biến thể blue- M và red- L
  ///suy ra sản phẩm không có biến thể mà user chọn
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    ///if selectedAttributes contains 3 attributes and current variations contains 2
    if (variationAttributes.length != selectedAttributes.length) return false;
    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  ///check product variation stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  ///check attribute availability/ stock in variation
  ///set là danh sách loại bỏ đi các giá trị trùng lặp
  Set<String?> getAttributeAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    ///check which attributes are available and stock is not 0
    final availableVariationAttributeValues = variations
        .where((variation) =>
            //check empty
            variation.attributeValues[attributeName] != null &&
            variation.attributeValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        .map((variation) => variation.attributeValues[attributeName])///chạy qua từng biến thể thỏa mãn điều kiện trên và lấy giá trị của attributeName
    ///kết quả tạo ra 1 danh sách mới chỉ chứa các giá trị của thuộc tính attributeName
        .toSet();//set là lấy giá trị không trùng lặp
    return availableVariationAttributeValues;
  }

  ///reset selected attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
