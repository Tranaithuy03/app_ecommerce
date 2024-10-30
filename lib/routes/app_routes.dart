import 'package:app_my_pham/feature/authentication/screens/Password_configuration/forgot_password.dart';
import 'package:app_my_pham/feature/authentication/screens/onboarding/onboarding.dart';
import 'package:app_my_pham/feature/authentication/screens/sign_up/signup.dart';
import 'package:app_my_pham/feature/authentication/screens/sign_up/verify_email.dart';
import 'package:app_my_pham/feature/personalization/screens/profile/profile.dart';
import 'package:app_my_pham/feature/personalization/screens/settings/setting.dart';
import 'package:app_my_pham/feature/shop/models/product_model.dart';
import 'package:app_my_pham/feature/shop/screen/cart/cart.dart';
import 'package:app_my_pham/feature/shop/screen/checkout/checkout.dart';
import 'package:app_my_pham/feature/shop/screen/home/home.dart';
import 'package:app_my_pham/feature/shop/screen/order/order.dart';
import 'package:app_my_pham/feature/shop/screen/product_details/product_detail.dart';
import 'package:app_my_pham/feature/shop/screen/product_reviews/product_review.dart';
import 'package:app_my_pham/feature/shop/screen/store/store.dart';
import 'package:app_my_pham/feature/shop/screen/wishlist/wishlist.dart';
import 'package:app_my_pham/routes/routes.dart';
import 'package:get/get.dart';

class AppRoute{
  static final pages=[
    GetPage(name: MPRoute.home, page: ()=>const HomeScreen()),
    GetPage(name: MPRoute.store, page: ()=>const StoreScreen()),
    GetPage(name: MPRoute.wishlist, page: ()=>const WishlistScreen()),
    GetPage(name: MPRoute.settings, page: ()=>const SettingScreen()),
    GetPage(name: MPRoute.productDetail, page: ()=> ProductDetail(product: ProductModel.empty(),)),
    GetPage(name: MPRoute.productReviews, page: ()=>const ProductReviewScreen()),
    GetPage(name: MPRoute.order, page: ()=>const MyOrderScreen()),
    GetPage(name: MPRoute.checkout, page: ()=>const CheckoutScreen()),
    GetPage(name: MPRoute.cart, page: ()=>const CartScreen()),
    GetPage(name: MPRoute.userProfile, page: ()=>const ProfileScreen()),
    GetPage(name: MPRoute.signup, page: ()=>const SignupScreen()),
    GetPage(name: MPRoute.verifyEmail, page: ()=>const VerifyEmailScreen()),
    GetPage(name: MPRoute.forgetPassword, page: ()=>const ForgotPasswordScreen()),
    GetPage(name: MPRoute.onBoarding, page: ()=>const OnboardingScreen()),
  ];
}