import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCouponCode extends StatefulWidget {
  const TCouponCode({super.key});

  @override
  State<TCouponCode> createState() => _TCouponCodeState();
}

class _TCouponCodeState extends State<TCouponCode> {
  /// [isPromoCode] control Apply-button for apply promotion code
  bool isPromoCode = false;
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      padding: EdgeInsets.all(TSizes.sm),
      showBorder: true,
      backgroundColor: isDarkMode ? TColors.black : TColors.white,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              onEditingComplete: () => setState(() {
                if (controller.text.isNotEmpty) {
                  isPromoCode = true;
                } else {
                  isPromoCode = false;
                }
              }),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: TTexts.haveAPromoCode,
                hintStyle: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: isPromoCode
                    ? TColors.primary
                    : TColors.darkGrey,
              ),
              child: Text(TTexts.apply),
            ),
          ),
        ],
      ),
    );
  }
}
