

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exception.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instace => Get.find();

  // variables
  final _db = FirebaseFirestore.instance;

  /// get featured brands
  Future<List<BrandModel>> getFeaturedBrands({limit = 4}) async {
    try {
      final snapshots = await _db.collection("Brands").where("IsFeatured", isEqualTo: true).limit(limit).get();
      return snapshots.docs.map((brand) => BrandModel.fromSnapshot(brand)).toList();
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

  /// get all brand with [limit] variable
  Future<List<BrandModel>> getBrands({limit = 6}) async {
    try {
      final snapshots = await _db.collection("Brands").limit(limit).get();
      return snapshots.docs.map((brand) => BrandModel.fromSnapshot(brand)).toList();
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

  /// upload brand to firebase
  Future<void> uploadDummyData(BrandModel brand) async {
    try {
      await _db.collection("Brands").doc(brand.id).set(brand.toJson());
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