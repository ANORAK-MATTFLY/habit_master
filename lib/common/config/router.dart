import 'package:get/get.dart';
import 'package:habit_master/common/screens/home-screen/homescreen.dart';
import 'package:habit_master/features/authentication/presentation/login/login_screen.dart';
import 'package:habit_master/features/routine/presentation/routine-list/routine_list_screen.dart';

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
        name: '/login',
        page: () => const LoginScreen(),
        transition: Transition.cupertino),
  ];
}
