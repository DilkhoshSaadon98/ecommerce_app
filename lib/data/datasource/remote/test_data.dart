import 'package:econmerac_app/core/constant/crud.dart';
import 'package:econmerac_app/core/constant/link_api.dart';

class TestData {
  late Curd curd;
  TestData(this.curd);
  getData() async {
    var response = await curd.postrequest(ApiLink.linkLogin, {});
    return response.fold((l) => l, (r) => r);
  }
}
