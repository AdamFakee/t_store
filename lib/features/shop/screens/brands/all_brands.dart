import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brands/cards/brand_card.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/shimmers/brands/featured_brand_shimmer.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/screens/brands/brand_products.dart';
import 'package:t_store/l10n/app_localizations.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/popups/snack_bar.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BrandController());

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          TLanguage.of(context)?.brands ?? "",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: FutureBuilder(
          future: controller.fetchBrands(), 
          builder: (_, snapshot) {
            final loading = TFeaturedBrandShimmer(itemCount: 10,);
            if(snapshot.connectionState == ConnectionState.waiting) {
              return loading;
            }

            if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
              return Center(
                child: Text("Empty"),
              );
            }

            final brands = snapshot.data!;

            return TGridLayout(
              itemCount: brands.length,
              crossAxisCount: 2,
              mainAxisExtent: 80,
              itemBuilder: (_, index) {
                final brand = brands[index];
                return TBrandCard(
                  showBorder: true,
                  numberOfProducts: brand.productsCount,
                  titleBrand: brand.name,
                  imageUrl: brand.image,
                  onTap: () {
                    Get.to(() => BrandProducts(brand: brand));
                  },
                );
              },
            );
          }
        ),
      ),
    );
  }
}
