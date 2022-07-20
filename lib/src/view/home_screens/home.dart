import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyslimit_test/src/controllers/home_controller.dart';
import 'package:skyslimit_test/src/view/home_screens/profile_screen.dart';
import 'package:skyslimit_test/src/view/home_screens/repository.dart';

import '../../common_widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final gitController = Get.find<GitController>();
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    Future.delayed(const Duration(milliseconds: 100), () {
      gitController.getRepoData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black87,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Obx(() => textWidget(
            gitController.userId.value, 18, Colors.black54, FontWeight.w500)),
      ),
      body: SafeArea(
        child: GetBuilder<GitController>(
            init: GitController(),
            builder: (controller) {
              return controller.isLoading.value == true
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TabBar(
                          unselectedLabelColor: Colors.black,
                          labelColor: Colors.red,
                          tabs: const [
                            Tab(
                              icon: Icon(Icons.person),
                            ),
                            Tab(
                              icon: Icon(Icons.folder),
                            )
                          ],
                          controller: _tabController,
                          indicatorSize: TabBarIndicatorSize.tab,
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              const ProfileScreen(),
                              RepoScreen(
                                repoList: controller.repoModelData,
                              )
                            ],
                          ),
                        ),
                      ],
                    );
            }),
      ),
    );
  }
}
