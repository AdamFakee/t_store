import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of TLanguage
/// returned by `TLanguage.of(context)`.
///
/// Applications need to include `TLanguage.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: TLanguage.localizationsDelegates,
///   supportedLocales: TLanguage.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the TLanguage.supportedLocales
/// property.
abstract class TLanguage {
  TLanguage(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static TLanguage? of(BuildContext context) {
    return Localizations.of<TLanguage>(context, TLanguage);
  }

  static const LocalizationsDelegate<TLanguage> delegate = _TLanguageDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @loremText.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'**
  String get loremText;

  /// No description provided for @onBoardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Choose your product'**
  String get onBoardingTitle1;

  /// No description provided for @onBoardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Select Payment Method'**
  String get onBoardingTitle2;

  /// No description provided for @onBoardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Deliver at your door step'**
  String get onBoardingTitle3;

  /// No description provided for @onBoardingSubTitle1.
  ///
  /// In en, this message translates to:
  /// **'Welcome to a World of Limitless Choices – Your Perfect Product Awaits!'**
  String get onBoardingSubTitle1;

  /// No description provided for @onBoardingSubTitle2.
  ///
  /// In en, this message translates to:
  /// **'For Seamless Transactions, Choose Your Payment Path – Your Convenience, Our Priority!'**
  String get onBoardingSubTitle2;

  /// No description provided for @onBoardingSubTitle3.
  ///
  /// In en, this message translates to:
  /// **'From Our Doorstep to Yours – Swift, Secure, and Contactless Delivery!'**
  String get onBoardingSubTitle3;

  /// No description provided for @homeAppbarTitle.
  ///
  /// In en, this message translates to:
  /// **'Good day for shopping'**
  String get homeAppbarTitle;

  /// No description provided for @homeAppbarSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Adam fakee'**
  String get homeAppbarSubTitle;

  /// No description provided for @searchPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Search in Store'**
  String get searchPlaceholder;

  /// No description provided for @categoryPopularTitle.
  ///
  /// In en, this message translates to:
  /// **'Popular Categories'**
  String get categoryPopularTitle;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @productPopularTitle.
  ///
  /// In en, this message translates to:
  /// **'Products popular'**
  String get productPopularTitle;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'E-Mail'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @phoneNo.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNo;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember Me'**
  String get rememberMe;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget Password?'**
  String get forgetPassword;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @orSignInWith.
  ///
  /// In en, this message translates to:
  /// **'Or Sign in with'**
  String get orSignInWith;

  /// No description provided for @orSignUpWith.
  ///
  /// In en, this message translates to:
  /// **'Or Sign up with'**
  String get orSignUpWith;

  /// No description provided for @iAgreeTo.
  ///
  /// In en, this message translates to:
  /// **'I agree to'**
  String get iAgreeTo;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsOfUse;

  /// No description provided for @verificationCode.
  ///
  /// In en, this message translates to:
  /// **'verificationCode'**
  String get verificationCode;

  /// No description provided for @resendEmail.
  ///
  /// In en, this message translates to:
  /// **'Resend Email'**
  String get resendEmail;

  /// No description provided for @resendEmailIn.
  ///
  /// In en, this message translates to:
  /// **'Resend email in'**
  String get resendEmailIn;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome back,'**
  String get loginTitle;

  /// No description provided for @loginSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Discover Limitless Choices and Unmatched Convenience.'**
  String get loginSubTitle;

  /// No description provided for @signupTitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s create your account'**
  String get signupTitle;

  /// No description provided for @forgetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Forget password'**
  String get forgetPasswordTitle;

  /// No description provided for @forgetPasswordSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Don\'t worry sometimes people can forget too, enter your email and we will send you a password reset link.'**
  String get forgetPasswordSubTitle;

  /// No description provided for @changeYourPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Password Reset Email Sent'**
  String get changeYourPasswordTitle;

  /// No description provided for @changeYourPasswordSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Account Security is Our Priority! We\'ve Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.'**
  String get changeYourPasswordSubTitle;

  /// No description provided for @confirmEmail.
  ///
  /// In en, this message translates to:
  /// **'Verify your email address!'**
  String get confirmEmail;

  /// No description provided for @confirmEmailSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.'**
  String get confirmEmailSubTitle;

  /// No description provided for @emailNotReceivedMessage.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t get the email? Check your junk/spam or resend it.'**
  String get emailNotReceivedMessage;

  /// No description provided for @yourAccountCreatedTitle.
  ///
  /// In en, this message translates to:
  /// **'Your account successfully created!'**
  String get yourAccountCreatedTitle;

  /// No description provided for @yourAccountCreatedSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Your Ultimate Shopping Destination: Your Account is Created, Unleash the Joy of Seamless Online Shopping!'**
  String get yourAccountCreatedSubTitle;

  /// No description provided for @myName.
  ///
  /// In en, this message translates to:
  /// **'AdamFakee'**
  String get myName;

  /// No description provided for @myEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'buidinhtuan04@gmail.com'**
  String get myEmailAddress;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @store.
  ///
  /// In en, this message translates to:
  /// **'Store'**
  String get store;

  /// No description provided for @withList.
  ///
  /// In en, this message translates to:
  /// **'Withlist'**
  String get withList;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @featuredBrand.
  ///
  /// In en, this message translates to:
  /// **'Featured Brands'**
  String get featuredBrand;

  /// No description provided for @youMightLike.
  ///
  /// In en, this message translates to:
  /// **'You might like'**
  String get youMightLike;

  /// No description provided for @sportTabbar.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get sportTabbar;

  /// No description provided for @furnitureTabbar.
  ///
  /// In en, this message translates to:
  /// **'Furniture'**
  String get furnitureTabbar;

  /// No description provided for @electronicTabbar.
  ///
  /// In en, this message translates to:
  /// **'Electronics'**
  String get electronicTabbar;

  /// No description provided for @clothesTabbar.
  ///
  /// In en, this message translates to:
  /// **'Clothes'**
  String get clothesTabbar;

  /// No description provided for @hatTabbar.
  ///
  /// In en, this message translates to:
  /// **'Hats'**
  String get hatTabbar;

  /// No description provided for @wishList.
  ///
  /// In en, this message translates to:
  /// **'Wishlist'**
  String get wishList;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @accountSettings.
  ///
  /// In en, this message translates to:
  /// **'Account Settings'**
  String get accountSettings;

  /// No description provided for @myAddressesTitle.
  ///
  /// In en, this message translates to:
  /// **'My Addresses'**
  String get myAddressesTitle;

  /// No description provided for @myAddressesSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Set shopping delivery address'**
  String get myAddressesSubTitle;

  /// No description provided for @myCartTitle.
  ///
  /// In en, this message translates to:
  /// **'My Cart'**
  String get myCartTitle;

  /// No description provided for @myCartSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Add, remove products and move to checkout'**
  String get myCartSubTitle;

  /// No description provided for @myOrdersTitle.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrdersTitle;

  /// No description provided for @myOrdersSubTitle.
  ///
  /// In en, this message translates to:
  /// **'In-progress and Completed Orders'**
  String get myOrdersSubTitle;

  /// No description provided for @bankAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Bank Account'**
  String get bankAccountTitle;

  /// No description provided for @bankAccountSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Withdraw balance to registered bank account'**
  String get bankAccountSubTitle;

  /// No description provided for @myCouponsTitle.
  ///
  /// In en, this message translates to:
  /// **'My Coupons'**
  String get myCouponsTitle;

  /// No description provided for @myCouponsSubTitle.
  ///
  /// In en, this message translates to:
  /// **'List of all the discounted coupons'**
  String get myCouponsSubTitle;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @notificationsSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Set any kind of notification message'**
  String get notificationsSubTitle;

  /// No description provided for @accountPrivacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Account Privacy'**
  String get accountPrivacyTitle;

  /// No description provided for @accountPrivacySubTitle.
  ///
  /// In en, this message translates to:
  /// **'Manage data usage and connected accounts'**
  String get accountPrivacySubTitle;

  /// No description provided for @appSettings.
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get appSettings;

  /// No description provided for @loadDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Load Data'**
  String get loadDataTitle;

  /// No description provided for @loadDataSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Upload Data to your Cloud Firebase'**
  String get loadDataSubTitle;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @changeProfilePicture.
  ///
  /// In en, this message translates to:
  /// **'Change Profile Picture'**
  String get changeProfilePicture;

  /// No description provided for @profileInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile Information'**
  String get profileInfoTitle;

  /// No description provided for @personalInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInfoTitle;

  /// No description provided for @nameTitle.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameTitle;

  /// No description provided for @usernameTitle.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get usernameTitle;

  /// No description provided for @userIdTitle.
  ///
  /// In en, this message translates to:
  /// **'User ID'**
  String get userIdTitle;

  /// No description provided for @userIdValue.
  ///
  /// In en, this message translates to:
  /// **'45689'**
  String get userIdValue;

  /// No description provided for @emailTitle.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get emailTitle;

  /// No description provided for @phoneNumberTitle.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumberTitle;

  /// No description provided for @phoneNumberValue.
  ///
  /// In en, this message translates to:
  /// **'+92-317-8059528'**
  String get phoneNumberValue;

  /// No description provided for @genderTitle.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get genderTitle;

  /// No description provided for @genderValue.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get genderValue;

  /// No description provided for @dobTitle.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dobTitle;

  /// No description provided for @dobValue.
  ///
  /// In en, this message translates to:
  /// **'10 Oct, 1994'**
  String get dobValue;

  /// No description provided for @closeAccount.
  ///
  /// In en, this message translates to:
  /// **'Close Account'**
  String get closeAccount;

  /// No description provided for @nikeAirShoes.
  ///
  /// In en, this message translates to:
  /// **'Nike Air Jordon Shoes'**
  String get nikeAirShoes;

  /// No description provided for @inStock.
  ///
  /// In en, this message translates to:
  /// **'In Stock'**
  String get inStock;

  /// No description provided for @ountOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out Of Stock'**
  String get ountOfStock;

  /// No description provided for @stock.
  ///
  /// In en, this message translates to:
  /// **'Stock:'**
  String get stock;

  /// No description provided for @variation.
  ///
  /// In en, this message translates to:
  /// **'Variation:'**
  String get variation;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price:'**
  String get price;

  /// No description provided for @color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// No description provided for @size.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get addToCart;

  /// No description provided for @checkOut.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkOut;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @showMore.
  ///
  /// In en, this message translates to:
  /// **'Show more'**
  String get showMore;

  /// No description provided for @showLess.
  ///
  /// In en, this message translates to:
  /// **'Show less'**
  String get showLess;

  /// No description provided for @reviewAndRatingTitle.
  ///
  /// In en, this message translates to:
  /// **'Review & Rating'**
  String get reviewAndRatingTitle;

  /// No description provided for @reviewAndRatingSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Ratings and reviews are verified and are from people who use the same type of device that you use'**
  String get reviewAndRatingSubTitle;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Addresses'**
  String get address;

  /// No description provided for @homeAddress.
  ///
  /// In en, this message translates to:
  /// **'thon dong, xa nam cuong, huyen nam ha, tinh ha noi'**
  String get homeAddress;

  /// No description provided for @addNewAddress.
  ///
  /// In en, this message translates to:
  /// **'Add new Address'**
  String get addNewAddress;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @street.
  ///
  /// In en, this message translates to:
  /// **'Street'**
  String get street;

  /// No description provided for @postalCode.
  ///
  /// In en, this message translates to:
  /// **'Postal Code'**
  String get postalCode;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @haveAPromoCode.
  ///
  /// In en, this message translates to:
  /// **'Have a promo code? Enter here'**
  String get haveAPromoCode;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotal;

  /// No description provided for @shippingFee.
  ///
  /// In en, this message translates to:
  /// **'Shipping Fee'**
  String get shippingFee;

  /// No description provided for @taxFee.
  ///
  /// In en, this message translates to:
  /// **'Tax Fee'**
  String get taxFee;

  /// No description provided for @orderTotal.
  ///
  /// In en, this message translates to:
  /// **'Order Total'**
  String get orderTotal;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @shippingAddress.
  ///
  /// In en, this message translates to:
  /// **'Shipping Address'**
  String get shippingAddress;

  /// No description provided for @orderReview.
  ///
  /// In en, this message translates to:
  /// **'Order Review'**
  String get orderReview;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrders;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get order;

  /// No description provided for @processing.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get processing;

  /// No description provided for @shipmentOnTheWay.
  ///
  /// In en, this message translates to:
  /// **'Shipment on the way'**
  String get shipmentOnTheWay;

  /// No description provided for @delivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get delivered;

  /// No description provided for @shippingDate.
  ///
  /// In en, this message translates to:
  /// **'Shipping Date'**
  String get shippingDate;

  /// No description provided for @brands.
  ///
  /// In en, this message translates to:
  /// **'Brands'**
  String get brands;

  /// No description provided for @brand.
  ///
  /// In en, this message translates to:
  /// **'Brand'**
  String get brand;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @noInternetTitle.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get noInternetTitle;

  /// No description provided for @noInternetMessage.
  ///
  /// In en, this message translates to:
  /// **'Please check your wifi or mobile connection'**
  String get noInternetMessage;

  /// No description provided for @agreePrivacyPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Accept Privacy Policy'**
  String get agreePrivacyPolicyTitle;

  /// No description provided for @agreePrivacyPolicyMessage.
  ///
  /// In en, this message translates to:
  /// **'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.'**
  String get agreePrivacyPolicyMessage;

  /// No description provided for @emailSentTitle.
  ///
  /// In en, this message translates to:
  /// **'Email Sent'**
  String get emailSentTitle;

  /// No description provided for @emailSentMessage.
  ///
  /// In en, this message translates to:
  /// **'Pls check your inbox and verify your email.'**
  String get emailSentMessage;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again'**
  String get somethingWentWrong;

  /// No description provided for @weakPasswordMessage.
  ///
  /// In en, this message translates to:
  /// **'The password provided is too weak.'**
  String get weakPasswordMessage;

  /// No description provided for @emailAlreadyInUserMessage.
  ///
  /// In en, this message translates to:
  /// **'The account already exists for that email.'**
  String get emailAlreadyInUserMessage;

  /// No description provided for @signupFailsMessage.
  ///
  /// In en, this message translates to:
  /// **'Sign-up fails. Pls try again.'**
  String get signupFailsMessage;

  /// No description provided for @permissionDeniedMessage.
  ///
  /// In en, this message translates to:
  /// **'You do not have permission to perform this action.'**
  String get permissionDeniedMessage;

  /// No description provided for @unavailableMessage.
  ///
  /// In en, this message translates to:
  /// **'The server is currently unavailable. Please try again later.'**
  String get unavailableMessage;

  /// No description provided for @invalidEmailMessage.
  ///
  /// In en, this message translates to:
  /// **'The email address is malformed.'**
  String get invalidEmailMessage;

  /// No description provided for @firebaseGeneralErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'A Firebase error occurred. Please try again.'**
  String get firebaseGeneralErrorMessage;

  /// No description provided for @networkErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Network error. Please check your internet connection.'**
  String get networkErrorMessage;

  /// No description provided for @deviceNotSupportMessage.
  ///
  /// In en, this message translates to:
  /// **'This feature is not supported on your device.'**
  String get deviceNotSupportMessage;

  /// No description provided for @platformGeneralErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'A platform error occurred. Please try again.'**
  String get platformGeneralErrorMessage;
}

class _TLanguageDelegate extends LocalizationsDelegate<TLanguage> {
  const _TLanguageDelegate();

  @override
  Future<TLanguage> load(Locale locale) {
    return SynchronousFuture<TLanguage>(lookupTLanguage(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_TLanguageDelegate old) => false;
}

TLanguage lookupTLanguage(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return TLanguageEn();
    case 'vi':
      return TLanguageVi();
  }

  throw FlutterError(
    'TLanguage.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
