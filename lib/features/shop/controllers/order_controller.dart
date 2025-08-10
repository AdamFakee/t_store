import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/order/order_repository.dart';
import 'package:t_store/features/shop/models/order_model.dart';
import 'package:t_store/utils/popups/snack_bar.dart';


class OrderController extends GetxController {
  static OrderController get instace => Get.find();

  // varibales
  RxBool loading = false.obs;
  RxList<OrderModel> orders = <OrderModel>[].obs;

  final _currentUser = FirebaseAuth.instance.currentUser;

  final _orderRepo = OrderRepository.instance;

  @override
  void onInit() {
    fetchAllOrdersByUserId();
    super.onInit();
  }

  void fetchAllOrdersByUserId () async {
    try {
      // loading
      loading.value = true;

      final list = await _orderRepo.fetchAllOrdersByUserId(_currentUser!.uid);

      orders.assignAll(list);
      orders.refresh();


      // stop loading
      loading.value = false;
    } catch (e) {
      // stop loading
      loading.value = false;

      // show alter
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
    }
  }
}