import 'package:econmerac_app/core/class/status_request.dart';
import 'package:econmerac_app/core/constant/image_link.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class HandlingDataRequest extends StatelessWidget {
   StatusRequest statusRequset;
   Widget widget;
   HandlingDataRequest(
      {
        super.key,  required this.statusRequset,  required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequset == StatusRequest.loading
        ? Center(
            child:
                Lottie.asset(AppImageAssets.loading, width: 250, height: 250))
        : statusRequset == StatusRequest.offline
            ? Center(
                child: Lottie.asset(AppImageAssets.offline,
                    width: 250, height: 250))
            : statusRequset == StatusRequest.serverFaliure
                ? Center(
                    child: Lottie.asset(AppImageAssets.server,
                        width: 250, height: 250))
                :  widget;
  }
}
