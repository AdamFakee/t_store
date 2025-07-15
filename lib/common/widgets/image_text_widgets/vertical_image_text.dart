import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';


class TVeritcalImageText extends StatelessWidget {
  const TVeritcalImageText({
    super.key, required this.image, required this.title, this.textColor = TColors.white, this.backgroundColor = TColors.white, this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            padding: EdgeInsets.all(TSizes.sm),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: backgroundColor
            ),
            child: Center(
              // widget tạo ảnh bo góc tròn
              child: CircleAvatar(
                radius: 20, // Thuộc tính này là size của image
                backgroundImage: AssetImage(
                  image,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 55,
            child: Text(title, style: Theme.of(context).textTheme.titleMedium!.apply(color: textColor), maxLines: 1, overflow: TextOverflow.ellipsis,), )
        ],
      ),
    );
  }
}


