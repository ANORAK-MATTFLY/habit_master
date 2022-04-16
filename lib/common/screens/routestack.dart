import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/authentication/presentation/login/cubit/login_cubit.dart';
import 'package:habit_master/authentication/presentation/login/login_screen.dart';
import 'package:habit_master/common/screens/home-screen/homescreen.dart';

class RouteStack extends StatelessWidget {
  const RouteStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      Map _userAuth = state.user!['userAuth'];
      if (_userAuth['code'] == 200) return const HomeScreen();
      if (_userAuth['code'] == 404) return const LoginScreen();
      return const Scaffold();
    });
  }
}
