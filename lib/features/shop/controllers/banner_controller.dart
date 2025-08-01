import 'package:get/get.dart';
import 'package:t_store/data/repositories/banner/banner_repostory.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/utils/popups/snack_bar.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  final Rx<int> currentIndex = 0.obs;
  final loading = false.obs;
  final _bannerRepo = Get.put(BannerRepostory());
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  void updateIndex (index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  /// Load category data
  Future<void> fetchBanners() async {
    try {
      // show loading
      loading.value = true;

      // fetch categories
      final allBanners = await _bannerRepo.getAllCategories();

      // update categoriesList
      banners.assignAll(allBanners);

    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
    } finally {
      // stop loading
      loading.value = false;
    }
  }

  /// create dummy categories data
  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      // show loading
      loading.value = true;

      await _bannerRepo.uploadDummyData(banners);
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
    } finally {
      // stop loading
      loading.value = false;
    }
  }
}