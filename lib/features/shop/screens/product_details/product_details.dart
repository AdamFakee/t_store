import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:t_store/common/widgets/product/product_detail/product_detail_heading_text.dart';
import 'package:t_store/common/widgets/readmores/readmore_text.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_detail_add_to_cart.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_detail_attribute_selection.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_detail_metadata.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_rating_and_sharing.dart';
import 'package:t_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TProductDetailAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// --Product images
            TCurvedEdgeWidget(child: TProductImageSlider()),

            /// --Product desc
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
              ),
              child: Column(
                spacing: TSizes.md,
                children: [
                  /// --Rating & Sharing
                  TProductRatingAndSharing(),

                  /// --Information about product: stock, price, name....
                  TProductDetailMetaData(),

                  /// --Attributes selection
                  TProductDetailAttributesSelection(),

                  /// --Button Checkout
                  SizedBox(height: TSizes.sm,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(TTexts.checkOut),
                    ),
                  ),

                  /// --Description
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductDetailHeadingText(title: TTexts.description),
                      SizedBox(height: TSizes.spaceBtwItems / 2,),
                      TReadmoreText(text: TTexts.loremText)
                    ],
                  ),

                  Divider(),

                  /// Reviews
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ProductReviews());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TProductDetailHeadingText(title: "${TTexts.review} (199)"),
                        Icon(Icons.arrow_forward_ios_outlined, size: TSizes.md,)
                      ],
                    ),
                  ),

                  SizedBox(height: TSizes.sm,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
