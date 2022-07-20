import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../utils.dart/connectivity.dart';
import 'button_widget.dart';
import 'text_widget.dart';

//Error popup
class ErrorPopus {
  final gitController = Get.find<GitController>();
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
                  buttonName: "Ok",
                  onpressed: () {
                    gitController.hideLoading();
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
  internetError(title, text, route) {
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
                    if (await ConnectivityUtils.checkConnectivity(route)) {
                      Get.offAllNamed(route);
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
