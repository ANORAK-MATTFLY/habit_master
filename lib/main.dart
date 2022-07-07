import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/shared/bloc/onboarding_cubit.dart';
import 'features/auth/presentaation/bloc/sign_in_popup_cubit.dart';
import 'features/home/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habits Master',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (_) => OnboardingCubit(),
        ),
        BlocProvider(
          create: (_) => SignInPopupCubit(),
        ),
      ], child: const HomePage()),
    );
  }
}
