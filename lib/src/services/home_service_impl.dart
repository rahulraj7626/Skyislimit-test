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

  ///Homedata service
  @override
  Future<GitRepoModel> getGitHubData(uid) async {
    return GitRepoModel.fromJson(await _httpService
        .get(ApiConstants.repApi1 + uid + ApiConstants.repApi2));
  }

  ///post api that add shedule
  @override
  Future<SearchModel> searchUser(uid) async {
    return SearchModel.fromJson(
        await _httpService.get(ApiConstants.searchApi + uid));
  }
}
