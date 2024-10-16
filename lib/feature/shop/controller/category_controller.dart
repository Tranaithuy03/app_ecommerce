import 'package:app_my_pham/common/widgets/loaders.dart';
import 'package:app_my_pham/data/category/category_repository.dart';
import 'package:app_my_pham/feature/shop/models/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();
  final _categoryRepo = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  final isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }
  Future<void>fetchCategories()async{
    try{
      isLoading.value = true;
      final categories = await _categoryRepo.getAllCategories();
      allCategories.assignAll(categories);///gan gia tri list cho allcategories
      ///filter featured
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured&&category.parentId.isEmpty).take(8).toList());/// select top 8 category from allCategories where isfeatured =true and parentId is empty

    }catch(e){
      MPLoaders.errorSnackBar(title: 'Oh snap',message: e.toString());
    }
    finally{
      isLoading.value=false;
    }
  }
}