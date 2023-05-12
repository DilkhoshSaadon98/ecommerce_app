import 'package:econmerac_app/core/constant/crud.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Curd());
  }
}
