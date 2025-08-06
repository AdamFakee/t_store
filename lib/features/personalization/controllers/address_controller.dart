import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/address/address_repository.dart';
import 'package:t_store/features/personalization/models/address_model.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/snack_bar.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  @override
  void onInit() {
    fetchAllAddresses();
    super.onInit();
  }

  // Variables
  RxBool loading = false.obs;
  final _currentUser = FirebaseAuth.instance.currentUser;
  final AddressRepository _addressRepo = AddressRepository.instance;

  Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final RxList<AddressModel> addresses = <AddressModel>[].obs;

  User? get currentUser => _currentUser;

   // controllers for create new address
  TextEditingController name = TextEditingController(); // default: your username
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void fetchAllAddresses() async {
    try {
      // check user exit
      if (_currentUser == null) {
        TSnackBar.errorSnackBar(
          title: "Oh",
          message: "Unable to find your information",
        );
        return;
      }
      // start loading
      loading.value = true;

      final addresses = await _addressRepo.fetchAllAddressByUserId(
        _currentUser.uid,
      );

      for (var address in addresses) {
        if(address.selectedAddress == true) {
          selectedAddress.value = address;
          break;
        }
      }

      this.addresses.assignAll(addresses);
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
    } finally {
      // stop loading
      loading.value = false;
    }
  }

  void toggleSetDefaultAddress(AddressModel address) async {
    try {
      // check user exit
      if (_currentUser == null) {
        TSnackBar.errorSnackBar(
          title: "Oh",
          message: "Unable to find your information",
        );
        return;
      }
      // start loading
      loading.value = true;

      // tự click chính mình
      if(selectedAddress.value.id == address.id) {
        await _addressRepo.toggleSelecteDefaultAddress(address, _currentUser.uid);

        // thay đổi selectedAddress của bản thân
        for (var item in addresses) {
          if (item.id == address.id) item.selectedAddress = false;
        }
        selectedAddress.value = AddressModel.empty();

      } else {
        // click chọn thằng khác
        
        await _addressRepo.toggleSelecteDefaultAddress(address, _currentUser.uid, selectedAddress.value);

        // thay đổi selectedAddress của bản thân và thằng khác
        for (var item in addresses) {
          if (item.id == address.id) {
            item.selectedAddress = true;
            selectedAddress.value = item;
          } else {
            item.selectedAddress = false;
          }
        }
      }

      // thông báo thay đổi dữ liệu 
      addresses.refresh();
    } catch (e) {
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
    } finally {
      // stop loading
      loading.value = false;
    }
  }

  void createNewAddress() async {
    try {
      // loading
      TFullScreenLoader.openLoadingDialog();

      // check user exit
      if (_currentUser == null) {
        TFullScreenLoader.stopLoadingDialog();
        TSnackBar.errorSnackBar(
          title: "Oh",
          message: "Unable to find your information",
        );
        return;
      }

      // check network connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (isConnected == false) {
        // close loading
        TFullScreenLoader.stopLoadingDialog();

        // show alter
        TSnackBar.errorSnackBar(
          title: TTexts.noInternetTitle,
          message: TTexts.noInternetMessage,
        );
        return;
      }

      // validation
      if (formKey.currentState!.validate() == false) {
        // close loading
        TFullScreenLoader.stopLoadingDialog();

        return;
      }

      // create
      final AddressModel address = AddressModel(
        name: name.text,
        phoneNumber: phoneNumber.text,
        street: street.text,
        state: state.text,
        postalCode: postalCode.text,
        country: country.text,
      );
      _addressRepo.createNewAddress(address, _currentUser.uid);

      // reset form
      formKey.currentState?.reset();

      TFullScreenLoader.stopLoadingDialog();

      TSnackBar.successSnackBar(
        title: "Successfully",
        message: "Add new address successfully",
      );

      fetchAllAddresses();
    } catch (e) {
      TFullScreenLoader.stopLoadingDialog();
      TSnackBar.errorSnackBar(title: "Oh", message: e.toString());
    }
  }
}
