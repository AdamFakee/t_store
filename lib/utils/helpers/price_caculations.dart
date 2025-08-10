import 'package:t_store/features/shop/models/cart_item_model.dart';

class TPricingCalculator {
  /// -- Tính tổng giá (bao gồm thuế và phí ship)
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  /// -- Tính phí vận chuyển (trả về chuỗi định dạng 2 số thập phân)
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  /// -- Tính thuế (trả về chuỗi định dạng 2 số thập phân)
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  /// -- Lấy tỉ lệ thuế theo địa điểm
  static double getTaxRateForLocation(String location) {
    // Lookup the tax rate for the given location from a tax rate database or API.
    // Return the appropriate tax rate.
    return 0.10; // Ví dụ thuế 10%
  }

  /// -- Lấy phí vận chuyển theo địa điểm
  static double getShippingCost(String location) {
    // Lookup the shipping cost for the given location using a shipping rate API.
    // Calculate based on various factors like distance, weight, etc.
    return 5.00; // Ví dụ phí vận chuyển $5
  }

  /// -- Tính tổng giá trị giỏ hàng 
  static double calculateCartTotal(List<CartItemModel> cartItems) {
    double total = 0;
    for (var item in cartItems) {
      total += item.quantity * item.price;
    }
    return total;
  }
}
