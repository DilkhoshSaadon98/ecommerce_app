import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/middleware/mymiddleware.dart';
import 'package:ecommercecourse/view/screen/address/add_address.dart';
import 'package:ecommercecourse/view/screen/address/add_details_address.dart';
import 'package:ecommercecourse/view/screen/address/view_address.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/login_screen.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/signup.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/success_signup.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommercecourse/view/screen/auth/verifycodesignup.dart';
import 'package:ecommercecourse/view/screen/cart/cart_screen.dart';
import 'package:ecommercecourse/view/screen/checkout_screen.dart'; 
import 'package:ecommercecourse/view/main_screen.dart';
import 'package:ecommercecourse/view/screen/items_screen.dart';
import 'package:ecommercecourse/view/screen/language.dart';
import 'package:ecommercecourse/view/screen/offers/offers_screen.dart';
import 'package:ecommercecourse/view/screen/myfavorite.dart';
import 'package:ecommercecourse/view/screen/on_boarding/onboarding.dart';
import 'package:ecommercecourse/view/screen/orders/archive_screen.dart';
import 'package:ecommercecourse/view/screen/orders/details_screen.dart';
import 'package:ecommercecourse/view/screen/orders/pending_screen.dart';
import 'package:ecommercecourse/view/screen/product_details_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.cart, page: () => const CartScreen()),
  //!  Auth
  GetPage(name: AppRoute.login, page: () => const LoginScreen()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
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
  GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite()),
  //
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(
      name: AppRoute.addressadddetails, page: () => const AddressAddDetails()), 
];
