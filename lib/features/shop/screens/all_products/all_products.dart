import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/product/product_sortable/products_sortable.dart';
import 'package:t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/features/shop/controllers/products/all_products_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/popups/snack_bar.dart';

/// widget này dùng cho nhiều mục đích tuỳ vào việc sử dụng [query] để lấy ra products như thế nào
///
/// Mục đích sử dụng [futureBuilder] là để có thể truyền [futureMethod] vào từ các controller khác và không cần thêm hay sửa code ở [AllProductsController]
class AllProducts extends StatelessWidget {
  const AllProducts({
    super.key,
    this.query,
    required this.title,
    this.futureMethod,
  });

  final Query? query;
  final String title;
  /// [futureMethod] is pass "fucntion future" and dont need to use controller
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());

    return Scaffold(
      appBar: TAppBar(
        title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: FutureBuilder(
          future: futureMethod ?? controller.getProducts(query),
          builder: (_, snapshot) {
            final loading = TVerticalProductShimmer();
            if(snapshot.connectionState == ConnectionState.waiting) {
              return loading;
            }

            if(snapshot.hasError) {
              return TSnackBar.errorSnackBar(title: "Oh", message: TTexts.somethingWentWrong);
            }

            if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
              return Center(
                child: Text("Empty"),
              );
            }

            final products = snapshot.data!;

            return TProductsSortable(products: products,);
          },
        ),
      ),
    );
  }
}
