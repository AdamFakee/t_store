import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/loadings/circular_full_screen_loading.dart';
import 'package:t_store/common/widgets/tiles/setting_menu_tile.dart';
import 'package:t_store/features/personalization/controllers/upload_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';

class UploadDataScreen extends StatelessWidget {
  const UploadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploadController());
    return Obx(() {
      // loading
      if (controller.loading.value) {
        return TCircularFullScreenLoading();
      }
      // Core Ui
      return Scaffold(
        /// -- header title
        appBar: TAppBar(
          title: Text(
            "Upload dummy data",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          showBackButton: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    TSettingMenuTile(
                      title: "Upload categories",
                      icon: Iconsax.document_upload,
                      onTap: () => controller.uploadCategories(),
                    ),
                    TSettingMenuTile(
                      title: "Upload banners",
                      icon: Iconsax.document_upload,
                      onTap: () => controller.uploadBanners(),
                    ),
                    TSettingMenuTile(
                      title: "Upload products",
                      icon: Iconsax.document_upload,
                      onTap: () => controller.uploadProducts(),
                    ),
                    TSettingMenuTile(
                      title: "Upload brands",
                      icon: Iconsax.document_upload,
                      onTap: () => controller.uploadBrands(),
                    ),
                    TSettingMenuTile(
                      title: "Upload brand-category",
                      icon: Iconsax.document_upload,
                      onTap: () => controller.uploadBrandCategories(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
