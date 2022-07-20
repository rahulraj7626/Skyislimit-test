import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/text_form_fiels.dart';
import '../../controllers/home_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final uName = TextEditingController();
  final gitController = Get.find<GitController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(12),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Spacer(),
          Image.asset("assets/images/git.png"),
          const SizedBox(
            height: 40,
          ),
          TextFieldWidget(
            hint: "GitHub username",
            controller: uName,
            errMsg: "Required*",
          ),
          IconButton(
              onPressed: () {
                gitController.searchGitUser(uName.text);
              },
              icon: const Icon(
                Icons.arrow_circle_right,
                size: 40,
              )),
          const Spacer(),
        ]),
      ),
    );
  }
}
