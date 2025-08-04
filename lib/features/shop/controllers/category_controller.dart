import 'package:get/get.dart';
import 'package:t_store/data/repositories/categories/category_repostory.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/popups/snack_bar.dart';

class CategoryController extends GetxController {
  static CategoryController get instace => Get.find();

  /// variable
  final _categoryRepo = Get.put(CategoryRepostory());
  final loading = false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// Load category data (just take prarent category)
  Future<void> fetchCategories() async {
    try {
      // show loading
      loading.value = true;

      // fetch categories
      final categories = await _categoryRepo.getAllCategories();

      // update categoriesList
      allCategories.assignAll(categories);

      // filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8));
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
    } finally {
      // stop loading
      loading.value = false;
    }
  }

  /// Load category data (just take prarent category)
  Future<List<CategoryModel>> fetchSubCategoriesByCategoryId(String categoryId) async {
    try {
      // fetch categories
      return await _categoryRepo.getSubCategoriesByCategoryId(categoryId);
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
      return [];
    }
  }

  /// create dummy categories data
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // show loading
      loading.value = true;

      await _categoryRepo.uploadDummyData(categories);
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
    } finally {
      // stop loading
      loading.value = false;
    }
  }
}