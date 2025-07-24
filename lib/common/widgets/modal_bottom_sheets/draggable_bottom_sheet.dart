import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TDraggableBottomSheet {
  static Future show({
    required BuildContext context,
    required Widget child,
  }) {
    return showMaterialModalBottomSheet(
      expand: false,
      context: context,
      barrierColor: TColors.darkGrey.withOpacity(0.5),

      /// [DraggableScrollableSheet] có thể kéo thả điều chỉnh chiều cao chỉ khi bên trong nó có widget được kế thừa từ scrollController
      builder: (context) => DraggableScrollableSheet(
        snap: true,

        /// cho snapSizes được hoạt động
        snapSizes: [0.6, 0.8, 1],

        /// danh sách các nấc thang mà người dùng có thể kéo
        initialChildSize: 0.5,

        /// 50% height screen khi bật lên
        minChildSize: 0.4,
        maxChildSize: 1,

        expand: false,

        /// chỉ chiếm phần diện tích của [DraggableScrollableSheet] chứ không chiếm luôn diện tích của [showMaterialModalBottomSheet]
        ///
        /// expand = true => phần [barrierColor] của [showMaterialModalBottomSheet] sẽ không hiển thị
        builder: (context, scrollController) => Column(
          children: [
            /// --Indicator
            ///
            /// Việc dùng listview để dùng controllor
            ListView(
              /// Commen giải thích::::
              ///
              /// nghĩa là dùng scrollControler ở đây để khi scroll "child widget" sẽ điều khiển luôn cả widget "bottom sheet"
              /// vì đang sử dụng scrollController cấp cao nhất
              controller: scrollController,
              shrinkWrap: true,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 6,
                    margin: const EdgeInsets.only(
                      top: 4,
                      bottom: TSizes.defaultSpace,
                    ),
                    decoration: BoxDecoration(
                      color: TColors.darkGrey,
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
              ],
            ),

            /// --child
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (_) {
                  // khi widget này scroll sẽ không thông báo tới "parent widget"
                  return true;
                },
                child: SingleChildScrollView(
                  /// Commen giải thích::::
                  ///
                  /// nghĩa là không dùng scrollControler ở đây để khi scroll "child widget" sẽ không điều khiển luôn cả widget "bottom sheet"
                  /// vì đang sử dụng scrollController cấp cao nhất
                  ///
                  // controller: scrollController,
                  physics:
                      AlwaysScrollableScrollPhysics(), // cho phép "child widget" scroll
                  padding: EdgeInsets.only(
                    left: TSizes.md,
                    right: TSizes.md,
                    bottom: TSizes.md
                  ),
                  child: child
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
