import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TGridLayout extends StatelessWidget {
  const TGridLayout({
    super.key,
    required this.itemCount,
    this.physics,
    required this.crossAxisCount,
    required this.mainAxisExtent,
    required this.itemBuilder,
  });

  final int itemCount;
  final ScrollPhysics? physics;
  final int crossAxisCount;
  final double mainAxisExtent;
  final Widget Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // disabled scroll của gridview và thay vào đó việc scroll sẽ là của "parent widget" ( nếu có scroll )
      physics: physics ?? NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      shrinkWrap:
          true, // GridView tự tính toán để có kích thước phù hợp thay vì mở rộng vô cực
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount, // số cột
        mainAxisExtent: mainAxisExtent, // chiều cao
        crossAxisSpacing: TSizes.gridViewSpacing, // spacing
        mainAxisSpacing: TSizes.gridViewSpacing,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
