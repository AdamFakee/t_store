import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:t_store/features/authentication/controllers/onboarding/controller_onboarding.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';


class OnBoardingIndicator extends StatelessWidget {
  const OnBoardingIndicator({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 20,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController, // PageController
        onDotClicked: controller.dotNavigatorClick,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: isDarkMode ? TColors.textPrimary : TColors.buttonPrimary,
          dotColor: TColors.buttonSecondary,
          dotHeight: 10,
        ),
      ),
    );
  }
}
