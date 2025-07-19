import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:t_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:t_store/features/shop/screens/store/widgets/store_header.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/scroll_behavior.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
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
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(TSizes.sm),
              child: TCartCounterIcon(
                onPressed: () {},
                iconColor: Colors.black,
              ),
            ),
          ],
        ),
        body: NotificationListener<ScrollEndNotification>(
          onNotification: (notify) {
            if (!isReset) {
              TScrollBehavior.handleScroll(scrollController: _scrollController);
            }
            return true;
          },
          child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [TStoreHeader()];
            },
            body: Padding(
              padding: const EdgeInsets.all(TSizes.md),
              child: TabBarView(
                children: [
                  TCategoryTab(),
                  TCategoryTab(),
                  TCategoryTab(),
                  TCategoryTab(),
                  TCategoryTab(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

