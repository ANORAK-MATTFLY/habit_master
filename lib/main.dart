import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/auth/presentation/bloc/sign_in_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/routine_details/competition_screen/bloc/bloc_logic/select_option_logic.dart';
import 'package:habit_master/features/routine/presentation/pages/routine_details/competition_screen/widgets/daily_routine/select_when.dart';
import 'package:habit_master/shared/bloc/onboarding_cubit.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'features/auth/presentation/pages/onboarding_screen.dart';
import 'features/habits/presentation/pages/home_page.dart';
import 'features/habits/presentation/widgets/bottom_app_bar.dart';
import 'features/routine/presentation/cubit/timer_task.dart';
import 'features/routine/presentation/pages/routine_details/competition_screen/bloc/competitors_bloc.dart';
import 'features/routine/presentation/pages/routine_details/competition_screen/page/competition_page.dart';
import 'features/routine/presentation/pages/routine_details/competition_screen/widgets/daily_routine/add_habit_panel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'habits_local_database.db'),
  );

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
          create: (_) => SelectOptionsBloc(),
          child: const SelectWhen(options: null, title: null),
        ),
        BlocProvider(
          create: (_) => TimerTaskCubit(),
          child: const HabitPanel(),
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
