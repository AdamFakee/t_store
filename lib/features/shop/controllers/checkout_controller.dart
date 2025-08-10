import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/order/order_repository.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/features/personalization/models/address_model.dart';
import 'package:t_store/features/shop/controllers/products/cart_controller.dart';
import 'package:t_store/features/shop/models/order_model.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/helpers/price_caculations.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/snack_bar.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instace => Get.find();

  /// variable
  final RxDouble subTotal = 0.0.obs;
  final double shippingFee = TPricingCalculator.getShippingCost("");
  final double taxFee = TPricingCalculator.getTaxRateForLocation("");
  final RxDouble orderTotal = 0.0.obs;

  final _cartController = CartController.instace;
  final _addressController = Get.put(AddressController());

  final _currentUser = FirebaseAuth.instance.currentUser;

  final _orderRepo = OrderRepository.instance;
  
  @override
  void onInit() {
    _loadCheckoutFee();
    super.onInit();
  }

  void _loadCheckoutFee() {
    subTotal.value = TPricingCalculator.calculateCartTotal(_cartController.cartItems);
    orderTotal.value = TPricingCalculator.calculateTotalPrice(subTotal.value, "");
  }

  /// main funtion process check-out action 
  void checkOut() async {
    try {
      // Start dialog loader
      TFullScreenLoader.openLoadingDialog();

      // can check out
      final bool canCheckOut = await canCheckout();
      if(canCheckOut == false) {
        // stop dialog
        TFullScreenLoader.stopLoadingDialog();
        return;
      }

      // create order
      final OrderModel order = createNewOrderModel();
      
      // save to db
      await _orderRepo.createNewOrder(order);

      // stop loading
      TFullScreenLoader.stopLoadingDialog();
    } catch (e) {
      // stop loading
      TFullScreenLoader.stopLoadingDialog();

      // show alter
      TSnackBar.errorSnackBar(title: "Checkout fails", message: e.toString());
    }
  }

  Future<bool> canCheckout () async {
    // check network connection
    final isConnected = await NetworkManager.instance.isConnected();
    if (isConnected == false) {
      TSnackBar.errorSnackBar(
        title: TTexts.noInternetTitle,
        message: TTexts.noInternetMessage,
      );
      return false;
    }

    // check user exist
    if(_currentUser == null) {
      TSnackBar.warningSnackBar(title: "You can not checkout.", message: "We are not found your account.", duration: 5);
      return false;
    }

    // check default address
    if(_addressController.selectedAddress.value == AddressModel.empty()) {
      TSnackBar.warningSnackBar(title: "You can not checkout.", message: "You must give your address.", duration: 5);
      return false;
    }
    return true;
  }

  /// convert data to return new order-model
  OrderModel createNewOrderModel () {
    return OrderModel(
      userId: _currentUser!.uid, 
      userName: _currentUser.displayName!, 
      address: _addressController.selectedAddress.value, 
      totalOrderPrice: orderTotal.value, 
      status: OrderSatus.processing.name, 
      date: DateTime.now()
    );
  }
}