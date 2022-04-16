import 'package:get/get.dart';
import 'package:habit_master/authentication/presentation/login/login_screen.dart';
import 'package:habit_master/common/screens/home/home_screen.dart';
import 'package:habit_master/common/screens/routestack.dart';

List<GetPage<dynamic>> getPages() {
  return [
    GetPage(
        name: '/',
        page: () => const HomeScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: '/route-stack',
        page: () => const RouteStack(),
        transition: Transition.cupertino),
    GetPage(
        name: '/login',
        page: () => const LoginScreen(),
        transition: Transition.cupertino),
  ];
}
