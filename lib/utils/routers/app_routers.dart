import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/login/login_screen.dart';
import 'package:t_store/features/authentication/screens/register_screen/register.dart';
import 'package:t_store/features/authentication/screens/register_screen/verify_email.dart';
import 'package:t_store/features/personalization/screens/addresses/addresses.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/features/personalization/screens/settings/settings.dart';
import 'package:t_store/features/shop/screens/cart/cart.dart';
import 'package:t_store/features/shop/screens/checkout/checkout.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/features/shop/screens/orders/orders.dart';
import 'package:t_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:t_store/features/shop/screens/store/store.dart';
import 'package:t_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:t_store/utils/routers/routers.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const Store()),
    GetPage(name: TRoutes.favourites, page: () => const FavoriteScreen()),
    GetPage(name: TRoutes.settings, page: () => const Settings()),
    GetPage(name: TRoutes.productReviews, page: () => const ProductReviews()),
    GetPage(name: TRoutes.order, page: () => const Orders()),
    GetPage(name: TRoutes.checkout, page: () => const Checkout()),
    GetPage(name: TRoutes.cart, page: () => const Cart()),
    GetPage(name: TRoutes.userProfile, page: () => const Profile()),
    GetPage(name: TRoutes.userAddress, page: () => const Addresses()),
    GetPage(name: TRoutes.signup, page: () => const RegisterScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
  ];
}
