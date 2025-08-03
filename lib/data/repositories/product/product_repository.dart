import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exception.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController{
  static ProductRepository get instace => Get.find();

  // variables
  final _db = FirebaseFirestore.instance;

  /// Function to get featured product 
  /// 
  /// [limit] to set limit documents return from db. Default = 6
  Future<List<ProductModel>> getFeaturedProducts ({ limit = 6 }) async {
    try {
      final snapshot = await _db.collection("Products").where("IsFeatured", isEqualTo: true).limit(limit).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
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

  /// Function to get products with query
  /// 
  /// [limit] to set limit documents return from db. Default = 6
  Future<List<ProductModel>> fetchProductsByQuery (Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productsList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productsList;
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

  /// Function upload products dummy data to firebase
  Future<void> uploadDummyData (List<ProductModel> products) async {
    try {
      for (var product in products) {
        await _db.collection("Products").doc(product.id).set(product.toJson());
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