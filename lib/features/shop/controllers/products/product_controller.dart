import 'dart:math';

import 'package:get/get.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/popups/snack_bar.dart';

class ProductController extends GetxController{
  static ProductController get instace => Get.find();

  // variables
  final loading = false.obs;
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final _productRepo = Get.put(ProductRepository());

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  /// Function get featured products in db
  Future<void> fetchFeaturedProducts() async {
    try {
      // start loading
      loading.value = true;

      final products = await _productRepo.getFeaturedProducts();

      featuredProducts.assignAll(products);
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
    } finally {
      // stop loading
      loading.value = false;
    }
  }

  /// Function upload dummy products to db
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      // show loading
      loading.value = true;

      await _productRepo.uploadDummyData(products);
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
    } finally {
      // stop loading
      loading.value = false;
    }
  }

  /// Get product price or range product in variation
  String getProductPrices(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0;
    
    // if product have no variation or productVariation = null
    if(product.productType == ProductType.single.toString() || product.productVariations == null || product.productVariations!.isEmpty) {
      return "\$${product.salePrice > 0 ? product.salePrice : product.price}";
    } else {
      // if product contain variation
      for( var variation in product.productVariations!) {
        smallestPrice = min(smallestPrice, variation.salePrice);
        largestPrice = max(largestPrice, product.salePrice);
      }

      // check both equal => return one
      if (smallestPrice == largestPrice) {
        return "\$${smallestPrice.toStringAsFixed(0)}";
      } else {
        // otherwise => return "$17 - $20"
        return "\$${smallestPrice.toStringAsFixed(0)} - \$${largestPrice.toStringAsFixed(0)}";
      }

    }
  }

  /// Get discount percent
  String? getDiscoutPercent(double originalPrice, double? salePrice) {
    if(salePrice == null || salePrice <= 0.0) return null;
    if(originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  /// check product stock status
  String getProductStockStatus(int stock) {
    return stock > 0 ? "In Stock" : "Out of Stock";
  }

  Future<List<ProductModel>> fetchProductsByCategoryId(String categoryId, [int limit = 4]) async {
    try {
      // fetch
      return await _productRepo.fetchProductsByCategoryId(categoryId, limit);
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
      return [];
    }
  }


  /// get featured product with brandName
  Future<List<ProductModel>> fetchFeaturedProductByBrandName(
    String brandName,
  ) async {
    try {
      // fetch
      return await _productRepo.getFeaturedProductsByBrandName(
        brandName: brandName,
      );
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
      return [];
    }
  }

  /// get [cnt] image from [products]
  List<String> getRandomImagesFromProducts(
    List<ProductModel> products, {
    cnt = 3,
  }) {
    // merge all images in product to one list
    final images = products.expand((product) {
      if (product.images != null && product.images!.isNotEmpty) {
        return product.images!.cast<String>();
      }
      return <String>[];
    }).toList();

    // check images emtpy
    if (images.isEmpty) return []; 

    // change images position randomly
    final random = Random();
    images.shuffle(random);
    
    /// image is not equal [cnt]
    /// 
    /// get random image url in list<String>
    if (images.length < cnt) {
      final result = List<String>.from(images);
      while (result.length < cnt) {
        result.add(images[random.nextInt(images.length)]);
      }
      return result;
    }

    // return [cnt] images
    return images.take(cnt).toList();
  }

  Future<List<ProductModel>> fetchProductsByBrandName(String brandName) async {
    try {
      // fetch
      return await _productRepo.fetchProductsByBrandName(brandName);
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
      return [];
    }
  }
}