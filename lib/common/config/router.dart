import 'package:get/get.dart';
import 'package:habit_master/authentication/presentation/login/login_screen.dart';
import 'package:habit_master/common/screens/home-screen/homescreen.dart';
import 'package:habit_master/common/screens/routestack.dart';
import 'package:habit_master/routine/presentation/routine-list/routine_list_screen.dart';

List<GetPage<dynamic>> getPages() {
  return [
    GetPage(
        name: '/',
        page: () => const HomeScreen(),
        transition: Transition.cupertino),
        GetPage(
        name: '/routine-list',
        page: () => const RoutineListScreen(),
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
