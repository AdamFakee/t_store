import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/brand_category_model.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exception.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class BrandCategoryRepository extends GetxController {
  static BrandCategoryRepository get instace => Get.find();

  // variables
  final _db = FirebaseFirestore.instance;
  
  /// Upload categories to firebase 
  Future<void> uploadDummyData(List<BrandCategoryModel> brandCategories) async {
    try {
      for (var brandCategory in brandCategories) {
        await _db.collection("Brand_Categories").add(brandCategory.toJson());
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