import 'package:flutter/material.dart';

// widget này sẽ vẽ phần container giống kiểu có thêm 2 chân nhọn ở phía dưới
// nhằm tạo hiệu ứng container dưới ( ngang cấp nhưng container_index = clip_index + 1 ) bo góc và position top = -20 kiểu thế
class TCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // tạo đường thẳng từ 0 -> height
    path.lineTo(0, size.height);
    
    // vẽ góc
    final fistCurve = Offset(0, size.height - 20);
    final lastCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(fistCurve.dx, fistCurve.dy, lastCurve.dx, lastCurve.dy);

    // đường thẳng 
    final secondCurve = Offset(0, size.height - 20);
    final secondLastCurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(secondCurve.dx, secondCurve.dy, secondLastCurve.dx, secondLastCurve.dy);

    // vẽ góc
    final thirdCurve = Offset(size.width, size.height - 20);
    final thirdLastCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdCurve.dx, thirdCurve.dy, thirdLastCurve.dx, thirdLastCurve.dy);

    // tạo 1 đường thẳng từ vị trí hiện tại tới vị trí được định nghĩa
    // để 0 là vì giữ cho không gian của child widget không bị nghiêng - lệch ( đổi thử là biết )
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}