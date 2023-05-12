import 'package:econmerac_app/core/constant/crud.dart';
import 'package:econmerac_app/core/constant/link_api.dart';

class SignUpData {
  late Curd curd;
  SignUpData(this.curd);
  postData(String username , String password ,String email , String phone) async {
    var response = await curd.postrequest(ApiLink.linkSignUp, {
      'username' :username,
      'password' :password,
      'email' :email,
      'phone' :phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}