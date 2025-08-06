import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/utils/formatters/formatters.dart';

class AddressModel {
  String? id;
  final String name;
  final String phoneNumber;
  final String street;
  final String state;
  final String postalCode;
  final String country;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressModel({
    this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.state,
    required this.postalCode,
    required this.country,
    this.dateTime,
    this.selectedAddress = false, // là địa chỉ mặc định hay k
  });

  /// Return empty model
  static AddressModel empty() => AddressModel(
    id: '',
    name: '',
    phoneNumber: '',
    street: '',
    state: '',
    postalCode: '',
    country: '',
    dateTime: null,
    selectedAddress: false, 
  );

  /// Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "Name": name,
      "PhoneNumber": phoneNumber,
      "Street": street,
      "State": state,
      "PostalCode": postalCode,
      "Country": country,
      "DateTime": DateTime.now(),
      "SelectedAddress": selectedAddress,
    };
  }

  /// Create AddressModel from Firebase snapshot
  factory AddressModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data();
    if (data != null) {
      return AddressModel(
        id: document.id,
        name: data["Name"] ?? "",
        phoneNumber: data["PhoneNumber"] ?? "",
        street: data["Street"] ?? "",
        state: data["State"] ?? "",
        postalCode: data["PostalCode"] ?? "",
        country: data["Country"] ?? "",
        dateTime: data["DateTime"] != null
            ? (data["DateTime"] as Timestamp).toDate()
            : null,
        selectedAddress: data["SelectedAddress"] as bool? ?? false,
      );
    } else {
      return AddressModel.empty();
    }
  }

  /// Format phone number
  String get formattedPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  /// ví dụ: xã A, huyên B, tỉnh C, nước D
  String get specificAddress {
    List<String> parts = [
      street.trim(),
      state.trim(),
      postalCode.trim(),
      country.trim(),
    ];

    return parts.join(', ');
  }


  // so sánh 2 instace có bằng nhau hay k
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is AddressModel &&
            runtimeType == other.runtimeType &&
            id == other.id &&
            name == other.name &&
            phoneNumber == other.phoneNumber &&
            street == other.street &&
            state == other.state &&
            postalCode == other.postalCode &&
            country == other.country &&
            dateTime == other.dateTime &&
            selectedAddress == other.selectedAddress;
  }

  // convert data thành interger để check dễ hơn
  // đồng thời khi data thay đổi thì [hashcode] cũng thay đổi theo
  // 
  // lần sau sẽ dùng package: "equalteble"
  @override
  int get hashCode => Object.hash(
    id,
    name,
    phoneNumber,
    street,
    postalCode,
    country,
    dateTime,
    selectedAddress,
  );
}
