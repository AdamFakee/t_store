import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exception.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class CategoryRepostory extends GetxController {
  static CategoryRepostory get instace => Get.find();

  // variables
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection("Categories").get();
      final list = snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
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

  /// Get sub categories by parent categoryId
  Future<List<CategoryModel>> getSubCategoriesByCategoryId(String categoryId) async {
    try {
      final snapshot = await _db.collection("Categories").where("ParentId", isEqualTo: categoryId).get();
      final list = snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
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

  /// Upload categories to firebase 
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      for (var category in categories) {
        await _db.collection("Categories").doc(category.id).set(category.toJson());
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