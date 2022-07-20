import 'dart:async';
import 'package:get/get.dart';
import '../models/repo_model.dart';
import '../models/search_git_model.dart';
import '../route_manager/route.dart';
import '../services/home_service.dart';
import '../services/home_service_impl.dart';
import '../utils.dart/connectivity.dart';

class GitController extends GetxController {
  HomeService? _homeService;

  GitController() {
    _homeService = Get.find<HomeserviceImpl>();
  }

  ///define variables
  List<GitRepoModel> repoModelData = [];
  List<GitRepoModel> repoModelDataMain = [];
  RxBool isLoading = false.obs;
  SearchModel? searchModelData;
  RxString userId = "".obs;
  RxBool isSuccess = false.obs;
  // @override
  // void onInit() {
  //   getRepoData();
  //   super.onInit();
  // }

  ///calling api service
  Future getRepoData() async {
    if (await ConnectivityUtils.checkConnectivity(Routes.getHome())) {
      repoModelDataMain.clear();
      showLoading();
      update();
      repoModelDataMain = await _homeService!.getGitHubData(userId.value);
      repoModelData = repoModelDataMain;
      hideLoading();
      update();
    }
  }

  Future searchGitUser(searchKey) async {
    if (await ConnectivityUtils.checkConnectivity(Routes.getStart())) {
      showLoading();
      searchModelData = await _homeService!.searchUser(searchKey);
      hideLoading();
      if (searchModelData != null) {
        userId.value = searchModelData!.login;
        Get.toNamed(Routes.getHome());
      }
    }
  }

  search(searchKey) {
    repoModelData = repoModelDataMain;

    List<GitRepoModel> searchList = [];
    if (repoModelData.isNotEmpty) {
      showLoading();
      for (int i = 0; i < repoModelData.length; i++) {
        if (repoModelData[i]
            .name
            .toLowerCase()
            .contains(searchKey.toString().toLowerCase())) {
          searchList.add(repoModelData[i]);
        }
      }
      hideLoading();
      repoModelData = searchList;
      update();
    }
  }

  ///show loading
  showLoading() {
    isLoading.toggle();
  }

  ///hide loading
  hideLoading() {
    isLoading.toggle();
  }
}
