import 'package:econmerac_app/core/constant/crud.dart';
import 'package:econmerac_app/core/constant/link_api.dart';

class CheckEmailData {
  late Curd curd;
  CheckEmailData(this.curd);
  postData(String email  ) async {
    var response = await curd.postrequest(ApiLink.linkCheckEmail, {
      'email' :email,
    });
    return response.fold((l) => l, (r) => r);
  }
}