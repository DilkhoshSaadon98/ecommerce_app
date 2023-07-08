import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/middleware/mymiddleware.dart';
import 'package:ecommercecourse/view/screen/address/add_address.dart';
import 'package:ecommercecourse/view/screen/address/add_details_address.dart';
import 'package:ecommercecourse/view/screen/address/view_address.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/forget_password_screen.dart';
import 'package:ecommercecourse/view/screen/auth/login_screen.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/reset_password_screen.dart';
import 'package:ecommercecourse/view/screen/auth/signup_screen.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/success_reset_password.dart';
import 'package:ecommercecourse/view/screen/auth/success_signup_screen.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/verify_code_reset_password.dart';
import 'package:ecommercecourse/view/screen/auth/verify_code_signup.dart';
import 'package:ecommercecourse/view/screen/cart/cart_screen.dart';
import 'package:ecommercecourse/view/screen/checkout/checkout_screen.dart'; 
import 'package:ecommercecourse/view/main_screen.dart';
import 'package:ecommercecourse/view/screen/items/items_screen.dart';
import 'package:ecommercecourse/view/screen/language.dart';
import 'package:ecommercecourse/view/screen/offers/offers_screen.dart';
import 'package:ecommercecourse/view/screen/favorite/myfavorite.dart';
import 'package:ecommercecourse/view/screen/on_boarding/onboarding.dart';
import 'package:ecommercecourse/view/screen/orders/details_screen.dart';
import 'package:ecommercecourse/view/screen/orders/pending_screen.dart';
import 'package:ecommercecourse/view/screen/product_details/product_details_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.cart, page: () => const CartScreen()),
  //!  Auth
  GetPage(name: AppRoute.login, page: () => const LoginScreen()),
  GetPage(name: AppRoute.signUp, page: () => const SignUpScreen()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPasswordScreen()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCodeResetPassword()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  //!
  GetPage(name: AppRoute.offersPage, page: () => const OffersScreen()),
  GetPage(name: AppRoute.homepage, page: () => const MainScreen()),
  GetPage(name: AppRoute.items, page: () => const ItemsScreen()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite()),
  //
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  //GetPage(name: AppRoute.offersProductDetails, page: () => const OffersProductDetails()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(
      name: AppRoute.addressadddetails, page: () => const AddressAddDetails()), 
];
