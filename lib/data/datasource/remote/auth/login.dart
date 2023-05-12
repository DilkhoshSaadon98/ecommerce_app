import 'package:econmerac_app/core/constant/crud.dart';
import 'package:econmerac_app/core/constant/link_api.dart';

class LoginData {
  late Curd curd;
  LoginData(this.curd);
  postData(String email ,String password ) async {
    var response = await curd.postrequest(ApiLink.linkLogin, {
      'email' :email,
      'password' :password,
    });
    return response.fold((l) => l, (r) => r);
  }
}