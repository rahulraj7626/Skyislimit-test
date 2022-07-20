import 'package:get/get.dart';
import 'package:skyslimit_test/src/models/search_git_model.dart';
import '../constants/api_constants.dart';
import '../models/repo_model.dart';
import '../network_manager/http_service.dart';
import '../network_manager/httpservice.dart';
import 'home_service.dart';

///implement abstract service class
class HomeserviceImpl implements HomeService {
  late HttpService _httpService;
  HomeserviceImpl() {
    _httpService = Get.put(HttpServiceRequests());
  }

  ///get repo list api
  @override
  Future<List<GitRepoModel>> getGitHubData(uid) async {
    final data = await _httpService
        .get(ApiConstants.repApi1 + uid + ApiConstants.repApi2);

    List<GitRepoModel> repoList = [];
    data.map((element) {
      repoList.add(GitRepoModel.fromJson(element));
    }).toList();

    return repoList;
  }

  ///post api that search username
  @override
  Future<SearchModel> searchUser(uid) async {
    return SearchModel.fromJson(
        await _httpService.get(ApiConstants.searchApi + uid));
  }
}
