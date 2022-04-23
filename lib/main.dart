import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:habit_master/common/config/router.dart';
import 'package:habit_master/common/config/themedata.dart';
import 'package:habit_master/features/authentication/presentation/login/cubit/login_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override 
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Habits Master',
        getPages: getPages(),
        theme: themeData(),
        initialRoute: '/route-stack',
      ),
    );
  }
}
