import 'package:econmerac_app/core/class/status_request.dart';
import 'package:econmerac_app/core/constant/app_routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  goToLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
    StatusRequest statusRequest = StatusRequest.none;
  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.loginScreen);
  }


  @override
  void onInit() {
    super.onInit();
  }
}
