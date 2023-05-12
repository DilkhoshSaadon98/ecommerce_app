import 'package:econmerac_app/core/constant/crud.dart';
import 'package:econmerac_app/core/constant/link_api.dart';

class VerifyCodeSignUp {
  late Curd curd;
  VerifyCodeSignUp(this.curd);
  postData(String email , String verifyCode) async {
    var response = await curd.postrequest(ApiLink.linkVerifyCode, {
      'email' :email,
      'verifycode' :verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}