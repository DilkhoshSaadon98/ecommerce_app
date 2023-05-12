import 'package:econmerac_app/core/class/status_request.dart';
import 'package:econmerac_app/core/constant/image_link.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
   StatusRequest statusRequset;
   Widget widget;
   HandlingDataView(
      {
        super.key,  required this.statusRequset,  required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequset == StatusRequest.loading
        ? Center(
            child:
                Lottie.asset(AppImageAssets.loading, width: 250, height: 250))
        : statusRequset == StatusRequest.offlineFailure
            ? Center(
                child: Lottie.asset(AppImageAssets.offline,
                    width: 250, height: 250))
            : statusRequset == StatusRequest.serverFaliure
                ? Center(
                    child: Lottie.asset(AppImageAssets.server,
                        width: 250, height: 250))
                : statusRequset == StatusRequest.serverFaliure
                    ? Center(
                        child: Lottie.asset(AppImageAssets.noData,
                            width: 250, height: 250))
                    : widget;
  }
}
