import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:t_store/features/shop/screens/store/widgets/store_header.dart';
import 'package:t_store/l10n/app_localizations.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/helpers/scroll_behavior.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> with TickerProviderStateMixin  {
  /// [_scrollController] for control the scroll when user scroll and suddenly take up their finger
  /// [isReset] is a flag to prevent recursive trigger when [scrollJumpToAnimate] is called that make [onNotification] is triggered.
  late final ScrollController _scrollController;
  bool isReset = TScrollBehavior.isReset;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instace.featuredCategories;
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            TLanguage.of(context)?.store ?? "",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(TSizes.sm),
              child: TCartCounterIcon(
                onPressed: () {},
                iconColor: isDarkMode ? TColors.light : Colors.black,
              ),
            ),
          ],
        ),
        body: NotificationListener<ScrollEndNotification>(
          onNotification: (notify) {
            final notifyMaxScrollExtent = notify.metrics.maxScrollExtent;
            final controllerMaxScrollExtent = _scrollController.position.maxScrollExtent;
            final currentPostion = _scrollController.position.pixels;

            /// currentPosition phải nằm trong phạm vi của header 
            /// sẽ được so sánh với [notifyMaxScrollExtent] - chiều cao của widget đang được scroll
            /// khi [notifyMaxScrollExtent] = [controllerMaxScrollExtent] nghĩa là đang scroll ở phạm vi header
            if(currentPostion < notifyMaxScrollExtent && notifyMaxScrollExtent == controllerMaxScrollExtent && isReset == false) {
              TScrollBehavior.handleScroll(scrollController: _scrollController);
            }

            
            /// cho phép thông báo được đẩy xuống các widget con
            /// return true => các widget con sẽ không bao giờ nhận được thông báo.
            return false;
          },
          child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [TStoreHeader()];
            },
            body: Padding(
              padding: const EdgeInsets.all(TSizes.md),
              child: TabBarView(
                children: categories.map((category) => TCategoryTab(category: category)).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
