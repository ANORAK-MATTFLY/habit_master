import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/shared/bloc/onboarding_cubit.dart';
import 'features/auth/presentaation/pages/onboarding_screen.dart';
import 'features/home/presentation/pages/home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Habits Master',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
