import 'package:flutter/material.dart';

/// a class helper handle logic for control the scroll when user scroll and suddenly take up their finger
class TScrollBehavior {
  /// [isReset] is a flag to prevent recursive trigger when [scrollJumpToAnimate] is called that make [onNotification] - property in [NotificationListener<ScrollEndNotification>] is triggered.
  static bool isReset = false;

  static void scrollJumpToAnimate({
    required double givenPosition,
    required ScrollController scrollController,
  }) {
    scrollController.jumpTo(givenPosition);

    /// -- its not work
    // _scrollController.animateTo(givenPosition, duration: Duration(milliseconds: 100), curve: Curves.ease);
  }

  static void handleScroll({required ScrollController scrollController}) {
    if (isReset) return;

    double currentPosition = scrollController.position.pixels;
    double maxExtent = scrollController.position.maxScrollExtent;
    double minExtent = scrollController.position.minScrollExtent;

    /// rate is % height with current postion.
    double rate = currentPosition / maxExtent;

    isReset = true;

    if (rate > 0.4) {
      scrollJumpToAnimate(
        givenPosition: maxExtent,
        scrollController: scrollController,
      );
    } else {
      scrollJumpToAnimate(
        givenPosition: minExtent,
        scrollController: scrollController,
      );
    }

    /// Update [isReset] after specific time to prevent [onNotification] run [handleScroll]
    Future.delayed(Duration(milliseconds: 150), () {
      isReset = false;
    });
  }
}
