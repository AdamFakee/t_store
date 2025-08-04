import 'package:get/get.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';
import 'package:t_store/utils/popups/snack_bar.dart';


class FavoriteProductController extends GetxController {
  static FavoriteProductController get instace => Get.find();

  /// storage key 
  final _favoriteKey = "FAVORITES";

  // variables
  final _productRepo = ProductRepository.instace;
  final _favoriteProductUids = <String, bool>{}.obs;
  final _storage = TLocalStorage();

  @override
  void onInit() {
    getAllFavoriteProducsUids();
    super.onInit();
  }

  /// init variable get all the productId in local_storage
  void getAllFavoriteProducsUids() {
    final raw = _storage.readData('FAVORITES');
    final Map<String, bool> datas = raw != null ? Map<String, bool>.from(raw) : {};


    _favoriteProductUids.assignAll(datas);
  }

  /// checking whether product stay in [wishList] or not
  bool isExist(String productId) {
    return _favoriteProductUids[productId] ?? false;
  }

  /// using to add/remove product in/out wishlist
  Future<void> toogle (String productId) async {
    if(isExist(productId)) {
      _favoriteProductUids.remove(productId);
      await save();
      _favoriteProductUids.refresh();
      TSnackBar.customSnackBar(message: "Product removed from favorites");
    } else {
      _favoriteProductUids[productId] = true;
      await save();
      _favoriteProductUids.refresh();
      TSnackBar.customSnackBar(message: "Product saved to favorites.");
    }
  }

  /// using to save [_favoriteProductUids] to local_storage
  Future<void> save () async {
    try {
      _storage.saveData(_favoriteKey, _favoriteProductUids);
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: "Add favorite product fail");
    }
  }

  Future<List<ProductModel>> fetchProductsByProductIds () async {
    try {
      // convert map<ProductId, boolean> to List<ProductId>
      final List<String> productIds = _favoriteProductUids.keys.toList();
      return await _productRepo.fetchProductsByProductIds(productIds);
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
      return [];
    }
  }
}