import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:t_store/features/personalization/models/address_model.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exception.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

/// học dùng singleton pattern
/// 
/// ít dùng singleton của getx lại
class AddressRepository {
  // instance
  static final AddressRepository _instance = AddressRepository._internal();

  // Private constructor
  AddressRepository._internal();

  static AddressRepository get instance => _instance;

  // variable
  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchAllAddressByUserId (String userId) async {
    try {
      final snapshot = await _db.collection("Users").doc(userId).collection("Addresses").get();
      return snapshot.docs.map((address) => AddressModel.fromSnapshot(address)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException().message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw TTexts.somethingWentWrong;
    }
  }

  /// create new [address] for user by [userId]
  Future<void> createNewAddress (AddressModel address, String userId) async {
    try {
      await _db.collection("Users").doc(userId).collection("Addresses").add(address.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException().message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw TTexts.somethingWentWrong;
    }
  }

  /// togle selectedAddress for [address], [oldSelectedAddress]
  Future<void> toggleSelecteDefaultAddress (AddressModel address, String userId, [AddressModel? oldSelectedAddress]) async {
    try {
      await _db.collection("Users").doc(userId).collection("Addresses").doc(address.id).update({
        "SelectedAddress": !address.selectedAddress
      });
      if(oldSelectedAddress != null && oldSelectedAddress.id != null && oldSelectedAddress.id != "") {
        await _db.collection("Users").doc(userId).collection("Addresses").doc(oldSelectedAddress.id).update({
        "SelectedAddress": !oldSelectedAddress.selectedAddress
      });
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException().message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw TTexts.somethingWentWrong;
    }
  }
}
