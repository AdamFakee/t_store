import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:t_store/common/widgets/texts/section_text_heading.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

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
                  SizedBox(height: TSizes.spaceBtwSections,),
                  // search 
                  TSearchContainer(),
                  SizedBox(height: TSizes.spaceBtwSections,),

                  // heading category
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:  TSizes.md),
                    child: TSectionTextHeading(
                      title: TTexts.categoryPopularTitle,
                    ),
                  ),
                  SizedBox(height: TSizes.md,),

                  // category scrollable 
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                    child: SizedBox(
                      height: 80,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        itemBuilder: (_, index) {
                          return TVeritcalImageText(
                            title: 'day la category',
                            image: TImage.lightAppLogo,
                            onTap: () {
                              
                            },
                          );
                        }, separatorBuilder: (_, _) => SizedBox(width: TSizes.md,),
                      ),
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



