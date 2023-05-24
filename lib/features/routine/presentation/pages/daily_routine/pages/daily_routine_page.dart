import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/routine/domain/logic/input_validation.dart';
import 'package:habit_master/features/routine/domain/logic/score_logic.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';
import 'package:habit_master/features/routine/infrastructure/repository/habit_repository.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_event/create_habit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_logic/create_habit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/cubit/time_option_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/cubit/timer_task.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/cubit/type_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/cubit/when_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/widgets/v1/habit_options.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/widgets/v1/select_when.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/bloc/timer_bloc.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/habit_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/habits_list.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/minutes_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/timer_controller_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/timer_habit_cubit.dart';
import 'package:habit_master/shared/bloc/error_cubit.dart';
import 'package:habit_master/shared/bloc/show_error_cubit.dart';
import 'package:habit_master/shared/static/dates.dart';
import 'package:habit_master/shared/static/options.dart';
import 'package:habit_master/shared/widgets/dynamic_island.dart';
import 'package:habit_master/shared/widgets/error.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';

import '../../../../domain/logic/task_helpers.dart';
import '../widgets/v1/expansion_item.dart';
import '../widgets/v1/progress.dart';
import '../widgets/v1/chart_and_desc.dart';

class DailyRoutinePage extends StatefulWidget {
  const DailyRoutinePage({Key? key}) : super(key: key);

  @override
  State<DailyRoutinePage> createState() => _DailyRoutinePageState();
}

class _DailyRoutinePageState extends State<DailyRoutinePage>
    with SingleTickerProviderStateMixin {
  bool showCreateHabitPanel = false;
  final TextEditingController taskName = TextEditingController();
  final TextEditingController taskDuration = TextEditingController();
  bool showError = false;
  bool showAppBar = true;
  bool canClose = false;
  bool showShareModal = false;

  @override
  Widget build(BuildContext context) {
    getHabits(List<Habit> streamedHabits) =>
        context.read<HabitListCubit>().updateState(streamedHabits);
    final routine = context.read<RoutineCubit>().state!;

    final timerControllerCubit = context.read<TimerControllerCubit>();

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final canDisplayTimeTask = context.read<TimerTaskCubit>();
    final taskType = context.read<TypeTaskCubit>();
    final taskMoment = context.read<MomentTaskCubit>();
    final taskTimeOption = context.read<TimeOptionCubit>();
    final showErrorPanel = context.read<ShowErrorCubit>();
    ScoreLogic().createScore(routine.authorID!);
    print(routine.type);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 3, 15),
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            showCreateHabitPanel = !showCreateHabitPanel;
            canClose = !canClose;
          });
        },
        child: routine.type == "remote"
            ? const Center()
            : Container(
                height: 40.0,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 216, 143, 255),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 216, 143, 255)
                          .withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 20.0,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: canClose == true
                    ? Center(
                        child: const Icon(
                          CupertinoIcons.clear,
                          size: 20.0,
                        ).animate().slideY(
                              begin: -1,
                              duration: const Duration(milliseconds: 500),
                            ),
                      )
                    : canClose == false
                        ? Center(
                            child: const Icon(
                              CupertinoIcons.add,
                              size: 17.0,
                            ).animate().slideY(
                                  begin: -1,
                                  duration: const Duration(milliseconds: 700),
                                ),
                          )
                        : Center(
                            child: const Icon(
                              CupertinoIcons.add,
                              size: 17.0,
                            ).animate().slideY(
                                  begin: -1,
                                  duration: const Duration(milliseconds: 700),
                                ),
                          ),
              ).animate().slideY(
                  begin: -0.3,
                  duration: const Duration(milliseconds: 800),
                ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          StreamBuilder<List<Habit>>(
              stream: serviceLocator<HabitRepository>()
                  .getHabits(routine.authorID!),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Center(
                      child: Text("An error occurred"),
                    );
                  case ConnectionState.waiting:
                    final List<Habit> streamedHabits = [];
                    getHabits(streamedHabits);
                    final habits = context.read<HabitListCubit>().state;
                    final ratios = TaskHelpers().getRatio(habits);
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: const Color.fromARGB(255, 7, 3, 15),
                      child: Column(
                        children: [
                          Flexible(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.only(top: 90.0),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30.0),
                                    bottomRight: Radius.circular(30.0)),
                                color: Colors.black,
                              ),
                              child: ChartAndDescription(routine: routine),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: SizedBox(
                              height: 430,
                              width: (MediaQuery.of(context).size.width),
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 20.0),
                                    child: ExpandedItemList(
                                      title: "Start your Morning Routine",
                                      progressRatio: progress(
                                        "${ratios[0][0]}/${ratios[0][1]}",
                                        const Color.fromARGB(255, 255, 230, 0),
                                      ),
                                      shimmer: Colors.white.withOpacity(0.2),
                                      color: const Color.fromARGB(
                                          255, 255, 230, 0),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 20.0),
                                    child: ExpandedItemList(
                                      title: "Kickoff your Afternoon!",
                                      progressRatio: progress(
                                        "${ratios[1][0]}/${ratios[1][1]}",
                                        const Color.fromARGB(
                                            255, 246, 149, 255),
                                      ),
                                      color: const Color.fromARGB(
                                          255, 246, 149, 255),
                                      shimmer: const Color.fromARGB(
                                          255, 246, 149, 255),
                                    ),
                                  ),
                                  ExpandedItemList(
                                    title: "Finish your day in style!",
                                    progressRatio: progress(
                                      "${ratios[2][0]}/${ratios[2][1]}",
                                      const Color.fromARGB(255, 0, 255, 247),
                                    ),
                                    color:
                                        const Color.fromARGB(255, 0, 255, 247),
                                    shimmer:
                                        const Color.fromARGB(255, 0, 255, 247),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  case ConnectionState.active:
                    final streamedTasks = snapshot.data!;
                    getHabits(streamedTasks);
                    final habits = context.read<HabitListCubit>().state;
                    final ratios = TaskHelpers().getRatio(habits);
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: const Color.fromARGB(255, 7, 3, 15),
                      child: Column(
                        children: [
                          Flexible(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.only(top: 90.0),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30.0),
                                    bottomRight: Radius.circular(30.0)),
                                color: Colors.black,
                              ),
                              child: ChartAndDescription(routine: routine),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: SizedBox(
                              height: 430,
                              width: (MediaQuery.of(context).size.width),
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 20.0),
                                    child: ExpandedItemList(
                                      title: "Start your Morning Routine",
                                      progressRatio: progress(
                                        "${ratios[0][0]}/${ratios[0][1]}",
                                        const Color.fromARGB(255, 255, 230, 0),
                                      ),
                                      shimmer: Colors.white.withOpacity(0.2),
                                      color: const Color.fromARGB(
                                          255, 255, 230, 0),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 20.0),
                                    child: ExpandedItemList(
                                      title: "Kickoff your Afternoon!",
                                      progressRatio: progress(
                                        "${ratios[1][0]}/${ratios[1][1]}",
                                        const Color.fromARGB(
                                            255, 246, 149, 255),
                                      ),
                                      color: const Color.fromARGB(
                                          255, 246, 149, 255),
                                      shimmer: const Color.fromARGB(
                                          255, 246, 149, 255),
                                    ),
                                  ),
                                  ExpandedItemList(
                                    title: "Finish your day in style!",
                                    progressRatio: progress(
                                      "${ratios[2][0]}/${ratios[2][1]}",
                                      const Color.fromARGB(255, 0, 255, 247),
                                    ),
                                    color:
                                        const Color.fromARGB(255, 0, 255, 247),
                                    shimmer:
                                        const Color.fromARGB(255, 0, 255, 247),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  case ConnectionState.done:
                    {
                      final streamedTasks = snapshot.data!;
                      getHabits(streamedTasks);
                      final habits = context.read<HabitListCubit>().state;
                      final ratios = TaskHelpers().getRatio(habits);
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        color: const Color.fromARGB(255, 7, 3, 15),
                        child: Column(
                          children: [
                            Flexible(
                              flex: 4,
                              child: Container(
                                padding: const EdgeInsets.only(top: 90.0),
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30.0),
                                      bottomRight: Radius.circular(30.0)),
                                  color: Colors.black,
                                ),
                                child: ChartAndDescription(routine: routine),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: SizedBox(
                                height: 430,
                                width: (MediaQuery.of(context).size.width),
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20.0),
                                      child: ExpandedItemList(
                                        title: "Start your Morning Routine",
                                        progressRatio: progress(
                                          "${ratios[0][0]}/${ratios[0][1]}",
                                          const Color.fromARGB(
                                              255, 255, 230, 0),
                                        ),
                                        shimmer: Colors.white.withOpacity(0.2),
                                        color: const Color.fromARGB(
                                            255, 255, 230, 0),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20.0),
                                      child: ExpandedItemList(
                                        title: "Kickoff your Afternoon!",
                                        progressRatio: progress(
                                          "${ratios[1][0]}/${ratios[1][1]}",
                                          const Color.fromARGB(
                                              255, 246, 149, 255),
                                        ),
                                        color: const Color.fromARGB(
                                            255, 246, 149, 255),
                                        shimmer: const Color.fromARGB(
                                            255, 246, 149, 255),
                                      ),
                                    ),
                                    ExpandedItemList(
                                      title: "Finish your day in style!",
                                      progressRatio: progress(
                                        "${ratios[2][0]}/${ratios[2][1]}",
                                        const Color.fromARGB(255, 0, 255, 247),
                                      ),
                                      color: const Color.fromARGB(
                                          255, 0, 255, 247),
                                      shimmer: const Color.fromARGB(
                                          255, 0, 255, 247),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                }
              }),
          BlocBuilder<StreamTimerBLoc, Stream<String>?>(
              buildWhen: (previous, current) {
            return previous != current;
          }, builder: (context, state) {
            if (state == null) {
              return const Center();
            }
            if (timerControllerCubit.state == true) {
              state.take(0);
              return const Center();
            }
            return StreamBuilder<String>(
                stream:
                    state.takeWhile((_) => timerControllerCubit.state == false),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center();
                  }

                  if (snapshot.data == "60") {
                    context.read<MinutesCounterCubit>().updateState();
                  }
                  if (context.read<MinutesCounterCubit>().state >=
                      context.read<MinutesCubit>().state) {
                    final Habit habit = context.read<HabitTimerCubit>().state!;
                    timerControllerCubit.updateState();
                    serviceLocator<HabitRepository>().toggleHabit(habit, true);
                    return const Center();
                  }

                  final String remainingTime = snapshot.data!;
                  return DynamicIsland(
                      remainingTime:
                          "${context.read<MinutesCounterCubit>().state} : $remainingTime");
                });
          }),
          Visibility(
            visible: showCreateHabitPanel,
            child: ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      height: (height - 100.0),
                      width: width,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 7, 3, 15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 100.0,
                            width: width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    "My new habit...",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Twitterchirp",
                                      fontSize: 20.0,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(0, 255, 255, 255),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 119, 119, 119),
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: taskName,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Twitterchirp_bold",
                                      fontSize: 13.0,
                                      decoration: TextDecoration.none,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    decoration: const InputDecoration(
                                      labelStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 140, 140, 140),
                                        fontFamily: "Twitterchirp_bold",
                                        fontSize: 13.0,
                                        decoration: TextDecoration.none,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      labelText: "Add an habit here...",
                                      border: InputBorder.none,
                                    ),
                                    validator: (value) {
                                      final validate = CreateHabitValidation()
                                          .validateHabitName(value!);
                                      context
                                          .read<ErrorMessageCubit>()
                                          .updateState(validate);
                                      return validate;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 100.0,
                            width: double.infinity,
                            child: Wrap(
                              spacing: 15.0,
                              runSpacing: 5.0,
                              alignment: WrapAlignment.center,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      taskName.text = "Meditate 🧘‍♂️";
                                    },
                                    child: habitOption("Meditate 🧘‍♂️")),
                                GestureDetector(
                                    onTap: () {
                                      taskName.text = "Read a book📕";
                                    },
                                    child: habitOption("Read a book📕")),
                                GestureDetector(
                                    onTap: () {
                                      taskName.text = "Work 👨‍💼";
                                    },
                                    child: habitOption("Work 👨‍💼")),
                                GestureDetector(
                                    onTap: () {
                                      taskName.text = "Running 🏃‍♂️";
                                    },
                                    child: habitOption("Running 🏃‍♂️")),
                                GestureDetector(
                                    onTap: () {
                                      taskName.text = "Writing ✍";
                                    },
                                    child: habitOption("Writing ✍")),
                                GestureDetector(
                                    onTap: () {
                                      taskName.text = "Walk my dog 🐩";
                                    },
                                    child: habitOption("Walk my dog 🐩")),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            width: 200.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "When",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Twitterchirp",
                                    fontSize: 15.0,
                                    decoration: TextDecoration.none,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SelectWhen(
                                    options: momentOptions, title: "moment"),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            width: 200.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "Type",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Twitterchirp",
                                    fontSize: 15.0,
                                    decoration: TextDecoration.none,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SelectWhen(options: typeOptions, title: "type"),
                              ],
                            ),
                          ),
                          BlocBuilder<TimerTaskCubit, bool>(
                            bloc: canDisplayTimeTask,
                            builder: (context, canDisplayTimeTask) {
                              return Visibility(
                                  visible: canDisplayTimeTask,
                                  child: SizedBox(
                                    height: 80,
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text(
                                          "How many?",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Twitterchirp",
                                            fontSize: 15.0,
                                            decoration: TextDecoration.none,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          height: 50,
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                0, 255, 255, 255),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                            border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 119, 119, 119),
                                              width: 1.0,
                                              style: BorderStyle.solid,
                                            ),
                                          ),
                                          child: TextFormField(
                                            cursorColor: const Color.fromARGB(
                                                255, 243, 176, 255),
                                            keyboardType: TextInputType.number,
                                            controller: taskDuration,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Twitterchirp_bold",
                                              fontSize: 13.0,
                                              decoration: TextDecoration.none,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            decoration: const InputDecoration(
                                              fillColor: Colors.white,
                                              focusColor: Colors.white,
                                              labelStyle: TextStyle(
                                                decorationColor: Colors.white,
                                                color: Color.fromARGB(
                                                    255, 166, 166, 166),
                                                fontFamily: "Twitterchirp_bold",
                                                fontSize: 13.0,
                                                decoration: TextDecoration.none,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              labelText: "Duration",
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                        const SelectWhen(
                                            options: ["Minutes"],
                                            title: "time"),
                                      ],
                                    ),
                                  ));
                            },
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () async {
                                if (context
                                        .read<ErrorMessageCubit>()
                                        .state
                                        .isEmpty ==
                                    false) {
                                  setState(() {
                                    context
                                        .read<ShowErrorCubit>()
                                        .updateState(true);
                                  });
                                }
                                if ((taskType.state == typeOptions[1]) &&
                                    (taskDuration.text.isEmpty)) {
                                  context
                                      .read<ShowErrorCubit>()
                                      .updateState(true);

                                  context.read<ErrorMessageCubit>().updateState(
                                      "Please set a duration for this habit");
                                  return;
                                }
                                if (taskName.text.isEmpty == true) {
                                  context
                                      .read<ShowErrorCubit>()
                                      .updateState(true);

                                  context.read<ErrorMessageCubit>().updateState(
                                      "The habit's name is required");
                                  return;
                                }
                                const uuid = Uuid();
                                final habit = Habit(
                                  id: uuid.v1(),
                                  expirationDate: expirationDate,
                                  routineID: routine.authorID,
                                  isDone: false,
                                  scheduledFor: taskMoment.state.toLowerCase(),
                                  type: taskType.state == typeOptions[0]
                                      ? "check"
                                      : "timer",
                                  habitName: taskName.text,
                                  duration:
                                      "${taskDuration.text}-${taskTimeOption.state}",
                                  doneOn: "",
                                );
                                context.read<CreateHabitBlocLogic>().add(
                                      CreateHabitAction(habit: habit),
                                    );
                                final habits =
                                    context.read<HabitListCubit>().state;
                                habits.add(habit);
                                context
                                    .read<HabitListCubit>()
                                    .updateState(habits);
                                setState(() {
                                  showCreateHabitPanel = !showCreateHabitPanel;
                                  canClose = false;
                                });
                              },
                              child: Container(
                                height: 40.0,
                                width: (180),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 255, 118, 108),
                                        Color.fromARGB(255, 255, 242, 121),
                                      ],
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      stops: [0.0, 0.9],
                                      tileMode: TileMode.clamp),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                              255, 255, 243, 105)
                                          .withOpacity(0.2),
                                      spreadRadius: 5,
                                      blurRadius: 30,
                                      offset: const Offset(
                                          2, 9), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Center(
                                  child: Text(
                                    "Create",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 7, 3, 15),
                                      fontFamily: "Twitterchirp",
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<ShowErrorCubit, bool>(
                      bloc: showErrorPanel,
                      builder: (context, showErrorPanel) => Visibility(
                        visible: showErrorPanel,
                        child: const ErrorPanel(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Visibility(
              visible: Timestamp.now().toDate().hour == 10 &&
                      showShareModal == false &&
                      Timestamp.now().toDate().minute < 30 ||
                  Timestamp.now().toDate().hour == 8 &&
                      showShareModal == false &&
                      Timestamp.now().toDate().minute < 30,
              child: SizedBox(
                height: 320.0,
                width: (width - 40),
                child: Stack(
                  children: [
                    Container(
                      height: 300.0,
                      width: (width - 40),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 119, 255, 255),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Share your progress on social media",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Twitterchirp",
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: 140.0,
                            width: 140.0,
                            child:
                                Lottie.asset("assets/animations/social.json"),
                          ),
                          GestureDetector(
                            onTap: () async {
                              const String imageUrl =
                                  "https://firebasestorage.googleapis.com/v0/b/habit-master-api.appspot.com/o/showcase.png?alt=media&token=03146ad6-545f-465a-b00b-9ef9c37f671a";
                              final url = Uri.parse(imageUrl);
                              final response = await http.get(url);
                              final bytes = response.bodyBytes;
                              final temp = await getTemporaryDirectory();
                              final path = '${temp.path}/illustration.png';
                              File(path).writeAsBytesSync(bytes);

                              // ignore: deprecated_member_use
                              Share.shareFiles(
                                [path],
                                text:
                                    "I've been following ${routine.authorName}'s daily routine this week! Join me and become a productivity guru! 💪, \n https://play.google.com/store/apps/details?id=com.softwareTools.habitMaster",
                                subject:
                                    "You've been invited to download Habit Master!",
                              );
                            },
                            child: Container(
                              height: 50.0,
                              width: 200.0,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 191, 107),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "Share",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Twitterchirp",
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 3.0,
                      right: 3.0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            showShareModal = true;
                          });
                        },
                        child: Container(
                          height: 30.0,
                          width: 30,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(360.0),
                            ),
                          ),
                          child: const Center(
                              child: Icon(
                            CupertinoIcons.clear,
                            color: Colors.white,
                            size: 15.0,
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
