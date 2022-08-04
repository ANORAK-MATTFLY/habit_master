import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/auth/presentation/bloc/sign_in_cubit.dart';
import 'package:habit_master/shared/bloc/onboarding_cubit.dart';
import 'features/auth/presentation/pages/onboarding_screen.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/home/presentation/widgets/bottom_app_bar.dart';
import 'features/routine/presentation/pages/routine_details/competion_screen/bloc/competitors_bloc.dart';
import 'features/routine/presentation/pages/routine_details/competion_screen/page/competition_page.dart';
import 'features/routine/presentation/pages/routine_details/navigation.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SignInCubit(),
          child: const OnboardingScreen(),
        ),
        BlocProvider(
          create: (_) => OnboardingCubit(),
          child: const HomePage(),
        ),
        BlocProvider(
          create: (_) => CompetitorsBloc(),
          child: const CompetitionScreen(),
        ),
        BlocProvider(
          create: (_) => CompetitorsBloc(),
          child: const RoutineNavigation(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Habits Master',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SuspendedBottomAppBar(),
      ),
    );
  }
}
