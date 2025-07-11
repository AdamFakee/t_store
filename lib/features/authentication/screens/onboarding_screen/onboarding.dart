import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/controllers.onboarding/controller_onboarding.dart';
import 'package:t_store/features/authentication/screens/onboarding_screen/widgets/onboarding_indicator.dart';
import 'package:t_store/features/authentication/screens/onboarding_screen/widgets/onboarding_page.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';

import 'widgets/onboarding_nextButton.dart';
import 'widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          // Onboarding page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
                imageString: TImage.onBoardingImage1,
              ),
              OnBoardingPage(
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
                imageString: TImage.onBoardingImage2,
              ),
              OnBoardingPage(
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
                imageString: TImage.onBoardingImage3,
              ),
            ],
          ),

          // Skip button
          OnBoardingSkip(),

          // Indicator
          OnBoardingIndicator(),
          // Next button
          OnBoardingNextButton(),
        ],
      ),
    );
  }
}

