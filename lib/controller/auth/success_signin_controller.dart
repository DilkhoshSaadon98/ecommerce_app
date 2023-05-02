import 'package:econmerac_app/core/constant/app_routes.dart';
import 'package:get/get.dart';

abstract class SuccessSignInController extends GetxController {
  checkEmail();
  goToSignUpVerifyCode();
}

class SuccessSignInControllerImp extends SuccessSignInController {
  @override
  goToSignUpVerifyCode() {
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  @override
  checkEmail() {}

  @override
  void onInit() {
    super.onInit();
  }
}
