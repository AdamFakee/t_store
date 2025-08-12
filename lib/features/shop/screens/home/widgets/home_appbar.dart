import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:t_store/l10n/app_localizations.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class THomeAppbar extends StatelessWidget {
  const THomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        children: [
          Text(
            TLanguage.of(context)?.homeAppbarTitle ?? "",
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: TColors.light),
          ),
          Text(
            TLanguage.of(context)?.homeAppbarSubTitle ?? "",
            style: Theme.of(context).textTheme.headlineSmall!
                .apply(color: TColors.light),
          ),
        ],
      ),
      actions: [
        // thêm padding để cho phần icon dịch sang 1 ít, còn không thì sẽ bị padding của class TAppbar đè mất giao diện 
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TCartCounterIcon(
            onPressed: () {
              
            },
          ),
        ),
      ],
    );
  }
}
