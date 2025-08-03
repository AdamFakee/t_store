import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/popups/snack_bar.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instace => Get.find();

  // variable
  final _productRepo = ProductRepository.instace;
  final selectedSortOption = "".obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  /// get products by query
  Future<List<ProductModel>> getProducts(Query? query) async {
    try {
      if(query == null) return [];
      
      return await _productRepo.fetchProductsByQuery(query);
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: TTexts.somethingWentWrong);
      return [];
    }
  }

  void sortProducts(String sortOption) {
    switch (sortOption) {
      case "Name":
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case "Higher Price":
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case "Lower Price":
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case "Sale":
        products.sort((a, b) {
          if(b.salePrice > 0) {
            return a.salePrice.compareTo(b.salePrice);
          } else if (a.salePrice > 0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;
      default: 
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
    }
  }

  void asignAllForProducts (List<ProductModel> products) {
    this.products.assignAll(products);
  }
}