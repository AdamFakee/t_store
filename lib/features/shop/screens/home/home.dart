import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/features/shop/screens/home/widgets/banner_slide.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_category.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Home app bar
                  THomeAppbar(),
                  SizedBox(height: TSizes.spaceBtwSections),
                  // search
                  TSearchContainer(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  // category
                  THomeCategory(),
                ],
              ),
            ),

            // body
            Padding(
              padding: EdgeInsets.all(TSizes.md),
              child: Column(
                children: [
                  TBannerSlider(banners: [TImage.promoBanner1, TImage.promoBanner2, TImage.promoBanner3, ],),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
