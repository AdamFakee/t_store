import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  final String image;
  final bool active;
  final String targetScreen;

  BannerModel({
    required this.image,
    required this.active,
    required this.targetScreen,
  });

  /// return empty model
  static BannerModel empty() =>
      BannerModel(image: "", active: false, targetScreen: "");

  Map<String, dynamic> toJson() {
    return {"Image": image, "Active": active, "TargetScreen": targetScreen};
  }

  factory BannerModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> documents,
  ) {
    if (documents.data() != null) {
      final data = documents.data()!;
      return BannerModel(
        image: data["Image"] ?? "",
        active: data["Active"] ?? false,
        targetScreen: data["TargetScreen"] ?? "",
      );
    } else {
      return BannerModel.empty();
    }
  }
}
