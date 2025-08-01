import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exception.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class BannerRepostory extends GetxController {
  static BannerRepostory get instace => Get.find();

  // variables
  final _db = FirebaseFirestore.instance;

  /// Get all banner
  Future<List<BannerModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection("Banners").where("Active", isEqualTo: true).get();
      final list = snapshot.docs.map((doc) => BannerModel.fromSnapshot(doc)).toList();
      return list;
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

  
  /// Upload banner to firebase 
  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      for (var banner in banners) {
        await _db.collection("Banners").add(banner.toJson());
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