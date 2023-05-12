import 'package:econmerac_app/core/constant/crud.dart';
import 'package:econmerac_app/core/constant/link_api.dart';

class ResetPasswordData {
  late Curd curd;
  ResetPasswordData(this.curd);
  postData(String email ,String password ) async {
    var response = await curd.postrequest(ApiLink.linkResetPassword, {
      'email' :email,
      'password' :password,
    });
    return response.fold((l) => l, (r) => r);
  }
}