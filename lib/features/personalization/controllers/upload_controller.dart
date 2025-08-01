import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/banner_controller.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/utils/helpers/dummy_data.dart';
import 'package:t_store/utils/popups/snack_bar.dart';

class UploadController extends GetxController {
  static UploadController get instace => Get.find();

  // variables
  final loading = false.obs;
  final _categoryController = Get.put(CategoryController());
  final _bannerController = Get.put(BannerController());
  final _dummyData = TDummyData(); 

  /// upload dummy categories to firebase
  Future<void> uploadCategories() async {
    try {
      loading(true);
      await _categoryController.uploadDummyData(_dummyData.categories);

      await _categoryController.fetchCategories();

      TSnackBar.successSnackBar(title: "Successfully", message: "Upload dummy data to firebase");
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
    } finally {
      loading(false);
    }
  }

  /// upload dummy banners to firebase
  Future<void> uploadBanners() async {
    try {
      loading(true);
      await _bannerController.uploadDummyData(_dummyData.banners);

      await _bannerController.fetchBanners();

      TSnackBar.successSnackBar(title: "Successfully", message: "Upload dummy data to firebase");
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
    } finally {
      loading(false);
    }
  }
}