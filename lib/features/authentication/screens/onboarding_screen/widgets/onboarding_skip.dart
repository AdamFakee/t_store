import 'package:flutter/material.dart';
import 'package:t_store/features/authentication/controllers.onboarding/controller_onboarding.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () {
          OnBoardingController.instance.skipPage();
        },
        child: Text("Skip", style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}
