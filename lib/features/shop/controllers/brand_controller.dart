import 'package:get/get.dart';
import 'package:t_store/data/repositories/brand/brand_repository.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/utils/popups/snack_bar.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final loading = false.obs;
  final _brandRepo = Get.put(BrandRepository());
  final RxList<BrandModel> brands = <BrandModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedBrands();
    super.onInit();
  }

  /// Load featured brand in firebase
  Future<void> fetchFeaturedBrands() async {
    try {
      // show loading
      loading.value = true;

      // fetch categories
      final allBrands = await _brandRepo.getFeaturedBrands();

      // update categoriesList
      brands.assignAll(allBrands);

    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
    } finally {
      // stop loading
      loading.value = false;
    }
  }

  Future<List<BrandModel>> fetchBrands() async {
    try {
      // fetch 
      return await _brandRepo.getBrands(limit: 10);
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
      return [];
    }
  }

  /// create dummy brand data
  Future<void> uploadDummyData(List<BrandModel> brands) async {
    try {
      // show loading
      loading.value = true;

      for(var brand in brands) {
        await _brandRepo.uploadDummyData(brand);
      }
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
    } finally {
      // stop loading
      loading.value = false;
    }
  }
}