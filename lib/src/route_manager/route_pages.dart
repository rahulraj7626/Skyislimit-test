import 'package:get/get_navigation/get_navigation.dart';
import 'package:skyslimit_test/src/view/home_screens/home.dart';
import 'package:skyslimit_test/src/view/start_screen/search_screen.dart';
import '../dependency_binding/home_binding.dart';
import 'route_names.dart';

///define pages
const duration = Duration(milliseconds: 500);
const transition = Transition.cupertino;

class RoutesPages {
  static List<GetPage> routes = [
    GetPage(
        name: RouteName.homeRoute,
        page: () => const HomeScreen(),
        transition: transition,
        transitionDuration: duration,
        binding: HomeBinding()),
    GetPage(
        name: RouteName.startRoute,
        page: () => const SearchScreen(),
        transition: transition,
        transitionDuration: duration,
        binding: HomeBinding()),
  ];
}
