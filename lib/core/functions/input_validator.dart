import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == 'Username') {
    if (!GetUtils.isUsername(val)) {
      return 'Not Valid Username'.tr;
    }
  }
  if (type == 'E-mail') {
    if (!GetUtils.isEmail(val)) {
      return 'Not Valid E-mail'.tr;
    }
  }
  if (type == 'Phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'Not Valid Phone Number'.tr;
    }
  }
  if (val.length < min) {
    return 'Field Can\'t be less than $min';
  }
  if (val.length > max) {
    return 'Field Can\'t be Larger than $max';
  }
  if (val.isEmpty) {
    return 'Field Can\'t be Empty';
  }
}
