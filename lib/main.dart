import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/auth/presentation/pages/authentication/bloc/cubit/sign_in_cubit.dart';
import 'package:habit_master/features/auth/presentation/pages/authentication/page/authentication_panel.dart';
import 'package:habit_master/features/routine/infrastructure/data_sources/local_data_source/author_db.dart';
import 'package:habit_master/features/routine/presentation/pages/home/widgets/v1/large_card.dart';
import 'package:habit_master/features/routine/presentation/pages/competition_page.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_logic/create_task.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_logic/toggle_task_bloc.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/page/daily_routine_page.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/habit_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/tasks_list.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/widgets/v2/check_box_tile.dart';
import 'package:habit_master/features/routine/presentation/states/bloc_logic/competitors_bloc.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/cubit/time_option_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/cubit/timer_task.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/cubit/type_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/cubit/when_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/widgets/v1/select_when.dart';
import 'package:habit_master/shared/bloc/onboarding_cubit.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'features/routine/infrastructure/models/author_model.dart';
import 'features/routine/presentation/pages/home/page/home_page.dart';
import 'features/routine/presentation/pages/navigation/bottom_app_bar.dart';

import 'features/routine/presentation/pages/create_habit/page/add_habit_panel.dart';

void main() async {
  Future createAuthorMainIsolate() async {
    // SendPort sendPort
    try {
      final authorsExist = await AuthorDatabase.instance.checkIfAuthorsExist();
      if (authorsExist == false) {
        await AuthorDatabase.createAuthor(predefinedAuthors);
        // Isolate.exit(sendPort, "The initialization succeeded!");
      }
    } catch (e) {
      rethrow;
    }
  }

  WidgetsFlutterBinding.ensureInitialized();
  await createAuthorMainIsolate();

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
          child: const AuthenticationPanel(),
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
          create: (_) => TimerTaskCubit(),
          child: const HabitPanel(),
        ),
        BlocProvider(
          create: (_) => CreateTaskBlocLogic(),
          child: const DailyRoutinePage(),
        ),
        BlocProvider(
          create: (_) => TaskListCubit(),
          child: const DailyRoutinePage(),
        ),
        BlocProvider(
          create: (_) => TaskBlocLogic(),
          child: const CheckBoxItem(color: null, shimmer: null, task: null),
        ),
        BlocProvider(
          create: (_) => TimeOptionCubit(),
          child: const SelectWhen(options: [], title: ""),
        ),
        BlocProvider(
          create: (_) => MomentTaskCubit(),
          child: const SelectWhen(options: [], title: ""),
        ),
        BlocProvider(
          create: (_) => TypeTaskCubit(),
          child: const SelectWhen(options: [], title: ""),
        ),
        BlocProvider(
          create: (_) => HabitCubit(),
          child: const LargeCard(
            habits: [],
          ),
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
