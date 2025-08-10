import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/features/shop/controllers/order_controller.dart';
import 'package:t_store/features/shop/models/order_model.dart';
import 'package:t_store/features/shop/screens/orders/widgets/order_card_tile.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/formatters/formatters.dart';

class TListOrderCards extends StatelessWidget {
  const TListOrderCards({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderController());

    return Obx(() {
      return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) => orderCard(orderController.orders[index]),
        separatorBuilder: (_, _) => SizedBox(height: TSizes.spaceBtwItems),
        itemCount: orderController.orders.length,
      );
    });
  }

  Widget orderCard(OrderModel order) {
    return TRoundedContainer(
      showBorder: true,
      padding: EdgeInsets.symmetric(
        horizontal: TSizes.md
      ),
      backgroundColor: TColors.darkGrey.withOpacity(0.2),
      child: Column(
        children: [
          /// order status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TOrderCardTile(
                  title: order.status,
                  subtitle: TFormatter.formatDate(order.date),
                  icon: Icons.curtains_closed_outlined,
                  isStatusTile: true,
                ),
              ),

              Icon(Icons.arrow_forward_ios_sharp, size: TSizes.iconSm),
            ],
          ),

          /// --Order code & shipingDate
          Row(
            spacing: 6,
            children: [
              Expanded(
                child: TOrderCardTile(
                  subtitle: order.id ?? "",
                  title: TFormatter.formatDate(order.date),
                  icon: Icons.discount_outlined,
                ),
              ),
              Expanded(
                child: TOrderCardTile(
                  subtitle: TFormatter.formatDate(order.date),
                  title: TTexts.shippingDate,
                  icon: Icons.date_range_outlined,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
