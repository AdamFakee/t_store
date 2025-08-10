import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/personalization/models/address_model.dart';
import 'package:t_store/utils/constants/enums.dart';

class OrderModel {
  final String? id;
  final String userId; // order user account id
  final String userName; // order user account name
  final AddressModel address;
  final double totalOrderPrice;
  final String status;
  final DateTime date;

  OrderModel({
    this.id,
    required this.userId,
    required this.userName,
    required this.address,
    required this.totalOrderPrice,
    required this.status,
    required this.date,
  });

  static OrderModel empty() {
    return OrderModel(
      id: '',
      userId: '',
      userName: '',
      address: AddressModel.empty(),
      totalOrderPrice: 0.0,
      status: "",
      date: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'UserId': userId,
      'UserName': userName,
      'Address': address.toJson(),
      'TotalOrderPrice': totalOrderPrice,
      'Status': status,
      'Date': date.toIso8601String(),
    };
  }

  factory OrderModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data();

    if (data != null) {
      return OrderModel(
        id: document.id,
        userId: data['UserId'] ?? '',
        userName: data['UserName'] ?? '',
        address: data['ShippingAddress'] != null ? AddressModel.fromJson(data['ShippingAddress']) : AddressModel.empty(),
        totalOrderPrice: (data['TotalOrderPrice'] ?? 0).toDouble(),
        status: data['Status'] ?? OrderSatus.processing.name,
        date: DateTime.parse(data['Date']),
      );
    } else {
      return OrderModel.empty();
    }
  }
}
