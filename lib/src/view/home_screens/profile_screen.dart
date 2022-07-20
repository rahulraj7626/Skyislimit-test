import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../../common_widgets/text_widget.dart';
import '../../controllers/home_controller.dart';

///Profile screen
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gitController = Get.find<GitController>();
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              imageWidget(gitController.searchModelData!.avatarUrl, 100),
              const SizedBox(
                height: 10,
              ),
              textItem(gitController.searchModelData!.name, 22.0),
              textItem(gitController.searchModelData!.bio, 18.0),
              textItem(gitController.searchModelData!.location, 18.0),
              const SizedBox(
                height: 10,
              ),
              textItem(
                  'Followers: ${gitController.searchModelData!.followers} | Following: ${gitController.searchModelData!.following}',
                  16.0),
              textItem(
                  'Public Repo: ${gitController.searchModelData!.publicRepos} | Gists: ${gitController.searchModelData!.publicGists}',
                  16.0),
            ],
          )),
    );
  }
}

Widget textItem(txt, fSize) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: textWidget(txt, fSize, Colors.black54, FontWeight.w500),
  );
}

///cached image widget
CachedNetworkImage imageWidget(url, size) {
  return CachedNetworkImage(
    fit: BoxFit.cover,
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      width: double.parse(size.toString()),
      height: double.parse(size.toString()),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
      ),
    ),
    placeholder: (context, url) => const CircularProgressIndicator(),
    errorWidget: (context, url, error) => const Icon(Icons.person),
  );
}
