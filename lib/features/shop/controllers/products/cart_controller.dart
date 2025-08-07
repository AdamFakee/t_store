import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/products/variation_controller.dart';
import 'package:t_store/features/shop/models/cart_item_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';
import 'package:t_store/utils/popups/confirm_popup.dart';
import 'package:t_store/utils/popups/snack_bar.dart';

class CartController extends GetxController {
  static CartController get instace => Get.find();

  final _storage = TLocalStorage();
  final _variationController = Get.put(VariationController());

  // variables
  // ignore: non_constant_identifier_names
  final _STORAGE_KEY = "CART";

  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  RxInt numOfCartItems = 0.obs; // number of product in cart
  RxInt numOfProductAddToCart = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadCartItems();
  }

  /// load cartItems in device storage 
  void _loadCartItems () async {
    final raws = await _storage.readData(_STORAGE_KEY);
    final List<CartItemModel> datas = raws != null
    ? (raws as List).map((e) => CartItemModel.fromJson(e)).toList()
    : [];



    cartItems.assignAll(datas);
  }

  /// change num of product add to cart
  /// 
  /// isPlus == true : a = a + 1
  /// 
  /// isPlus == false: a = a - 1
  void changeNumOfProductAddToCart ({bool isPlus = true}) {
    if(isPlus) {
      numOfProductAddToCart.value++;
    } else {
      if(numOfProductAddToCart.value == 0) {
        return;
      }

      numOfProductAddToCart.value--;
    }
  }

  /// add item to carts
  /// 
  /// [product] is variable pass to [addItemToCart] when user want to add item but user not navigate to detail screen. Or have not variation....
  void addItemToCart(ProductModel product) {

    // variables
    final variantId = _variationController.selectedVariation.value.id;
    final productId = product.id;

    // add product to cart from outside product_detail_screen
    // set [numOfProductAddToCart] = 1 (default = 0)
    if (numOfProductAddToCart.value == 0) numOfProductAddToCart.value = 1;

    // --check item already exits in cart
    final bool itemExists = checkItemAlreadyExitsInCart(productId, variantId);
    if(itemExists) {
      TSnackBar.customSnackBar(message: "Product already in your cart");
      return;
    }
    // check stock

    final bool outOfStock = checkItemOutOfStock(product, variantId);
    if(outOfStock) {
      final message = variantId.isNotEmpty ? "Variant is out of stock" : "Product is out of stock";
      TSnackBar.customSnackBar(message: message);
      return;
    }
    // save
    final CartItemModel cartItem = convertProductToCartItem(product);
    cartItems.add(cartItem);

    // save to storage
    save();

    // reset attribute of variation
    _variationController.resetSelectedAttributes();

    // reset 
    numOfProductAddToCart.value = 0;
    cartItems.refresh();
  }

  bool checkItemAlreadyExitsInCart (String productId, [String variationId = ""]) {
    if(variationId.isNotEmpty) {
      return cartItems.any((cartItem) {
        return cartItem.productId == productId && cartItem.variationId == variationId;
      });
    } else {
      return cartItems.any((cartItem) {
        return cartItem.productId == productId;
      });
    }
  }

  bool checkItemOutOfStock (ProductModel product, [String variationId = ""]) {
    if(variationId.isNotEmpty) {
      return _variationController.selectedVariation.value.stock <= 0;
    } else {
      return product.stock <= 0;
    }
  }

  CartItemModel convertProductToCartItem (ProductModel product) {
    // variables
    final variant = _variationController.selectedVariation.value;
    final productId = product.id;

    return CartItemModel(
      productId: productId, 
      quantity: numOfProductAddToCart.value,
      title: product.title,
      variationId: variant.id,
      price: variant.id != "" ? variant.salePrice : product.salePrice,
      image: variant.id != "" ? variant.image : product.thumbnail,
      brandName: product.brand?.name ?? "",
      selectedVariation: Map<String, String>.from(_variationController.selectedAttributes)
    );
  }

  void save() {
    try {
      _storage.saveData(_STORAGE_KEY, cartItems);
      TSnackBar.customSnackBar(message: "Product added to your cart");
    } catch (_) {
      TSnackBar.customSnackBar(message: "Can't add product to your cart");
    }
  }

  int getProductQuantityByProductId(String productId) {
    for (final item in cartItems) {
      if (item.productId == productId) {
        return item.quantity;
      }
    }
    return 0;
  }

  /// increa number of specific product in cart. if num = 0 => show popup remove 
  /// 
  /// [isPlus] = true => +1
  /// 
  /// [isPlus] = false => -1
  /// 
  /// 
  /// using [cartItemIndex] to up perfomance when user spamly change [cartItem.quantity]. If have [cartItemIndex] => we dont need to loop all [cartItems].
  void changeProductQuantityInCart({
    required String productId,
    required int cartItemIndex,
    String variantId = "",
    bool isPlus = true,
  }) async {
    final currentItem = cartItems[cartItemIndex];
    final currentQty = currentItem.quantity;

    if (isPlus) {
      cartItems[cartItemIndex] = currentItem.copyWith(quantity: currentQty + 1);
    } else {
      if (currentQty > 1) {
        cartItems[cartItemIndex] = currentItem.copyWith(quantity: currentQty - 1);
      } else {
        // if [quatity] = 1 && [isPlus] = false => show popup ask user: "this action will remove this item".
        final bool confirm = await TConfirmPopup.show(title: "This item in cart will be remove. Are you sure?");

        if(confirm) {
          cartItems.removeAt(cartItemIndex);
        }
        return;
      }
    }

    cartItems.refresh(); // Cập nhật UI
  }

}