import 'package:econmerac_app/core/constant/crud.dart';
import 'package:econmerac_app/core/constant/link_api.dart';

class VerifyCodeForgetPasswordData {
  late Curd curd;
  VerifyCodeForgetPasswordData(this.curd);
  postData(String email ,String verifycode ) async {
    var response = await curd.postrequest(ApiLink.linkVerifyCodeResetPasswoprd, {
      'email' :email,
      'verifycode' :verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}