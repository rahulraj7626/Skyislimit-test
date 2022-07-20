import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../route_manager/route.dart';
import '../utils.dart/connectivity.dart';
import 'button_widget.dart';
import 'text_widget.dart';

//Error popup
class ErrorPopus {
  errorAlert(title, text) {
    return Get.defaultDialog(
        title: "",
        titlePadding: const EdgeInsets.all(0),
        content: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: textWidget(title, 24, Colors.red, FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: textWidget(text, 20, Colors.blue, FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ButtonWidget(
                  buttonName: "Okey",
                  onpressed: () {
                    Get.back();
                  },
                ),
              )

              ///no button
            ],
          ),
        ));
  }

  ///internet error popus
  internetError(title, text) {
    return Get.defaultDialog(
        title: "",
        titlePadding: const EdgeInsets.all(0),
        content: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: textWidget(title, 20, Colors.red, FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: textWidget(text, 18, Colors.blue, FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ButtonWidget(
                  buttonName: "Okey",
                  onpressed: () async {
                    ///checkConnectivity before back
                    Get.back();
                    if (await ConnectivityUtils.checkConnectivity()) {
                      Get.offAllNamed(Routes.getHome());
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
