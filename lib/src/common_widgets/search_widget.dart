import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

///Search widget
class SearchWidget extends StatelessWidget {
  final String hint;

  const SearchWidget({
    Key? key,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gitController = Get.find<GitController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        textInputAction: TextInputAction.search,

        ///Calling search method from controller
        onSubmitted: (value) {
          gitController.search(value);
        },
        onChanged: (value) {
          gitController.search(value);
        },
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            errorMaxLines: 2,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: const BorderSide(
                color: Colors.black45,
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35.0),
              borderSide: const BorderSide(
                color: Colors.black87,
                width: 1.0,
              ),
            ),
            contentPadding:
                const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: hint,
            // hintStyle: GoogleFonts.poppins(
            //   textStyle: TextFieldWidget.txtStyle,
            // ),
            fillColor: Colors.white),
      ),
    );
  }
}
