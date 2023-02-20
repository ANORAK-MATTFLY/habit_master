import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/auth/presentation/pages/authentication/bloc/cubit/sign_in_cubit.dart';
import 'package:habit_master/features/auth/presentation/pages/authentication/page/authentication_panel.dart';
import 'package:habit_master/features/routine/domain/logic/prebuilt_data.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_logic/create_author.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/cubit/timer_task.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/pages/personal_routine.dart';
import 'package:habit_master/features/routine/presentation/pages/home/widgets/v1/large_card.dart';
import 'package:habit_master/features/leader_board/presentation/page/leader_board_page.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_logic/create_habit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_logic/toggle_habit_bloc.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/pages/daily_routine_page.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/habit_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/tasks_list.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/widgets/v2/check_box_tile.dart';
import 'package:habit_master/features/leader_board/presentation/bloc/bloc_logic/competitors_bloc.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/cubit/time_option_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/cubit/type_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/cubit/when_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/widgets/v1/select_when.dart';
import 'package:habit_master/features/user_feed/presentation/user_feed/bloc/cubit/list_post.dart';
import 'package:habit_master/features/user_feed/presentation/user_feed/bloc/cubit/show_edit_panel.dart';
import 'package:habit_master/features/user_feed/presentation/user_feed/page/user_feed_page.dart';
import 'package:habit_master/shared/bloc/error_cubit.dart';
import 'package:habit_master/shared/bloc/onboarding_cubit.dart';
import 'package:habit_master/shared/bloc/show_error_cubit.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'features/routine/presentation/pages/home/page/home_page.dart';
import 'features/routine/presentation/pages/navigation/bottom_app_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  PrebuiltData().createPrebuiltData();
  openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'habits_local_database.db'),
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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
          create: (_) => CreateHabitBlocLogic(),
          child: const DailyRoutinePage(),
        ),
        BlocProvider(
          create: (_) => HabitListCubit(),
          child: const DailyRoutinePage(),
        ),
        BlocProvider(
          create: (_) => HabitBlocLogic(),
          child: const CheckBoxItem(color: null, shimmer: null, habit: null),
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
          create: (_) => RoutineCubit(),
          child: const LargeCard(
            routines: [],
          ),
        ),
        BlocProvider(
          create: (_) => TimerTaskCubit(),
          child: const DailyRoutinePage(),
        ),
        BlocProvider(
          create: (_) => TypeTaskCubit(),
          child: const DailyRoutinePage(),
        ),
        BlocProvider(
          create: (_) => MomentTaskCubit(),
          child: const DailyRoutinePage(),
        ),
        BlocProvider(
          create: (_) => TimeOptionCubit(),
          child: const DailyRoutinePage(),
        ),
        BlocProvider(
          create: (_) => ShowErrorCubit(),
          child: const DailyRoutinePage(),
        ),
        BlocProvider(
          create: (_) => ErrorMessageCubit(),
          child: const DailyRoutinePage(),
        ),
        BlocProvider(
          create: (_) => CreateAuthorBlocLogic(),
          child: const PersonalRoutinePage(),
        ),
        BlocProvider(
          create: (_) => ShowEditPanelCubit(),
          child: const UserFeedPage(),
        ),
        BlocProvider(
          create: (_) => ListOfPostCubit(),
          child: const UserFeedPage(),
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
