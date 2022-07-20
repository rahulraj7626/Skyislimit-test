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
  GitRepoModel? repoModelData;
  RxBool isLoading = false.obs;
  SearchModel? searchModelData;
  RxString userId = "".obs;
  RxBool isSuccess = false.obs;

  ///calling api service
  Future getRepoData() async {
    if (await ConnectivityUtils.checkConnectivity()) {
      showLoading();
      repoModelData = await _homeService!.getGitHubData(userId.value);
      hideLoading();
    }
  }

  Future searchGitUser(searchKey) async {
    if (await ConnectivityUtils.checkConnectivity()) {
      showLoading();
      searchModelData = await _homeService!.searchUser(searchKey);
      hideLoading();
      if (searchModelData != null) {
        userId.value = searchModelData!.login;
        Get.toNamed(Routes.getHome());
      }
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
