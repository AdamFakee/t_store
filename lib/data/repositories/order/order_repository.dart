import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:t_store/features/shop/models/order_model.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exception.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class OrderRepository {
  static final OrderRepository _instance = OrderRepository._internal();

  OrderRepository._internal();

  static OrderRepository get instance => _instance;

  // variables
  final _db = FirebaseFirestore.instance;
  
  Future<void> createNewOrder(OrderModel order) async {
    try {
      await _db.collection("Orders").add(order.toJson());
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

  Future<List<OrderModel>> fetchAllOrdersByUserId(String userId) async {
    try {
      final snapshot = await _db.collection("Orders").where("UserId", isEqualTo: userId).get();
      return snapshot.docs.map((order) => OrderModel.fromSnapshot(order)).toList();
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