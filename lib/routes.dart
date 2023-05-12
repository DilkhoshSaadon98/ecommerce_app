import 'package:econmerac_app/core/constant/app_routes.dart';
import 'package:econmerac_app/core/middleware/my_middleware.dart';
import 'package:econmerac_app/view/screen/auth/forget_password_ui/forget_password.dart';
import 'package:econmerac_app/view/screen/auth/login_screen.dart';
import 'package:econmerac_app/view/screen/auth/signup_screen.dart';
import 'package:econmerac_app/view/screen/auth/success_signup_screen.dart';
import 'package:econmerac_app/view/screen/auth/forget_password_ui/verfiy_code_screen.dart';
import 'package:econmerac_app/view/screen/auth/forget_password_ui/reset_password_screen.dart';
import 'package:econmerac_app/view/screen/auth/verify_code_signup_screen.dart';
import 'package:econmerac_app/view/screen/home_screen.dart';
import 'package:econmerac_app/view/screen/on_boarding_screen.dart';
import 'package:get/get.dart';

import 'view/screen/auth/forget_password_ui/success-reset_password_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: ()=>const OnBoardingScreen(),middlewares: [MyMiddleWare()]),

  GetPage(name: AppRoutes.loginScreen, page: ()=>const LoginScreen()),
  GetPage(name: AppRoutes.signupScreen, page: ()=>const SignUpScreen()),
  GetPage(name: AppRoutes.vrifyCodeScreen, page: ()=>const VerfiyCodeScreen()),
  GetPage(name: AppRoutes.vrifyCodeSignUpScreen, page: ()=>const VerifyCodeSignUpScreen()),
  GetPage(name: AppRoutes.resetPasswordScreen, page: ()=>const ResetPasswordScreen()),
  GetPage(name: AppRoutes.forgetPasswordScreen, page: ()=>const ForgetPasswordScreen()),
  GetPage(name: AppRoutes.successResetPasswordScreen, page: ()=>const SuccessResetPasswordScreen()),
  GetPage(name: AppRoutes.successSignUpScreen, page: ()=>const SuccessSignUpScreen()),
  GetPage(name: AppRoutes.homeScreen, page: ()=>const HomeScreen()),
];