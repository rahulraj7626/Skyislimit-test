import 'package:flutter/material.dart';

import '../../common_widgets/search_widget.dart';
import '../../common_widgets/text_widget.dart';
import '../../models/repo_model.dart';
import '../../utils.dart/url_utils.dart';

/// repository widget
class RepoScreen extends StatelessWidget {
  final List<GitRepoModel> repoList;
  const RepoScreen({Key? key, required this.repoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: SearchWidget(
            hint: 'Search',
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(12.0),
        //   child: textWidget('${repoList.length} Repo Found', 22, Colors.black87,
        //       FontWeight.w500),
        // ),
        Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: repoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return cardItem(
                      "${index + 1}. ${repoList[index].name}",
                      'Visibility:  ${repoList[index].visibility}',
                      'Language: ${repoList[index].language}',
                      repoList[index].htmlUrl);
                }))
      ]),
    );
  }
}

///Card widget
Widget cardItem(txt, priv, lang, link) {
  return GestureDetector(
    onTap: () {
      LauncherUtils.webLaunch(link);
    },
    child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: textWidget(txt, 18, Colors.black87, FontWeight.w500),
            ),
            textWidget(priv, 16, Colors.black54, FontWeight.w500),
            textWidget(lang, 16, Colors.black54, FontWeight.w500),
          ],
        )),
  );
}
