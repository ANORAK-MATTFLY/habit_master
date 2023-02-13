import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/routine/domain/logic/input_validation.dart';

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
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/habit_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/tasks_list.dart';
import 'package:habit_master/shared/bloc/error_cubit.dart';
import 'package:habit_master/shared/bloc/show_error_cubit.dart';
import 'package:habit_master/shared/static/dates.dart';
import 'package:habit_master/shared/static/options.dart';
import 'package:habit_master/shared/widgets/error.dart';
import 'package:uuid/uuid.dart';

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
  bool showCerateHabitPanel = false;
  final TextEditingController taskName = TextEditingController();
  final TextEditingController taskDuration = TextEditingController();
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    getTasks(streamedTasks) =>
        context.read<TaskListCubit>().updateState(streamedTasks);
    final routine = context.read<RoutineCubit>().state!;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final canDisplayTimeTask = context.read<TimerTaskCubit>();
    final taskType = context.read<TypeTaskCubit>();
    final taskMoment = context.read<MomentTaskCubit>();
    final taskTimeOption = context.read<TimeOptionCubit>();
    final showErrorPanel = context.read<ShowErrorCubit>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 3, 15),
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            showCerateHabitPanel = !showCerateHabitPanel;
          });
        },
        child: Container(
          height: 40.0,
          width: 40,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 216, 143, 255),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 216, 143, 255).withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 20.0,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: const Icon(
              CupertinoIcons.add,
              size: 20.0,
            ).animate().slideY(
                  begin: -1,
                  duration: const Duration(milliseconds: 500),
                ),
          ),
        ).animate().slideY(
              begin: -0.3,
              duration: const Duration(milliseconds: 800),
            ),
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0x00000000),
        elevation: 0,
        leading: Container(
          height: 30,
          width: 30,
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: const Color(0x42FFFFFF),
            borderRadius: const BorderRadius.all(
              Radius.circular(360),
            ),
            border: Border.all(
                color: const Color(0xFFFFFFFF),
                style: BorderStyle.solid,
                width: 0.4),
          ),
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.white,
              iconSize: 12.0,
            ),
          ),
        ),
        actions: [
          Container(
            height: 40.0,
            width: 40.0,
            margin: const EdgeInsets.only(top: 15, right: 20),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(360))),
            child: const CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage("assets/images/elon-musk.png"),
              backgroundColor: Colors.transparent,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(2.0),
              margin: const EdgeInsets.only(top: 15, right: 20),
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(360))),
              child: const CircleAvatar(
                radius: 30.0,
                backgroundImage:
                    AssetImage("assets/images/3d objects/Polyhedron.png"),
                backgroundColor: Colors.transparent,
              ),
            ),
          )
        ],
      ),
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
                    final List<Habit> streamedTasks = [];
                    getTasks(streamedTasks);
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: const Color.fromARGB(255, 7, 3, 15),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            child: SizedBox(
                              height: 430,
                              width: (MediaQuery.of(context).size.width),
                              child: ListView(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 40.0),
                                    child: ExpandedItemList(
                                      title: "Start your Morning Routine",
                                      progressRatio: progress(
                                        "0/3",
                                        const Color.fromARGB(255, 255, 230, 0),
                                      ),
                                      shimmer: Colors.white.withOpacity(0.2),
                                      color: const Color.fromARGB(
                                          255, 255, 230, 0),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 40.0),
                                    child: ExpandedItemList(
                                      title: "Kickoff your Afternoon!",
                                      progressRatio: progress(
                                        "0/4",
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
                                      "0/3",
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
                          ChartAndDescription(routine: routine),
                        ],
                      ),
                    );
                  case ConnectionState.active:
                    final streamedTasks = snapshot.data!;
                    getTasks(streamedTasks);
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: const Color.fromARGB(255, 7, 3, 15),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            child: SizedBox(
                              height: 430,
                              width: (MediaQuery.of(context).size.width),
                              child: ListView(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 40.0),
                                    child: ExpandedItemList(
                                      title: "Start your Morning Routine",
                                      progressRatio: progress(
                                        "0/3",
                                        const Color.fromARGB(255, 255, 230, 0),
                                      ),
                                      shimmer: Colors.white.withOpacity(0.2),
                                      color: const Color.fromARGB(
                                          255, 255, 230, 0),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 40.0),
                                    child: ExpandedItemList(
                                      title: "Kickoff your Afternoon!",
                                      progressRatio: progress(
                                        "0/4",
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
                                      "0/3",
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
                          ChartAndDescription(routine: routine),
                        ],
                      ),
                    );
                  case ConnectionState.done:
                    {
                      final streamedTasks = snapshot.data!;
                      getTasks(streamedTasks);
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        color: const Color.fromARGB(255, 7, 3, 15),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              child: SizedBox(
                                height: 430,
                                width: (MediaQuery.of(context).size.width),
                                child: ListView(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 40.0),
                                      child: ExpandedItemList(
                                        title: "Start your Morning Routine",
                                        progressRatio: progress(
                                          "0/3",
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
                                          const EdgeInsets.only(bottom: 40.0),
                                      child: ExpandedItemList(
                                        title: "Kickoff your Afternoon!",
                                        progressRatio: progress(
                                          "0/4",
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
                                        "0/3",
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
                            ChartAndDescription(routine: routine),
                          ],
                        ),
                      );
                    }
                }
              }),
          Visibility(
            visible: showCerateHabitPanel,
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
                                                    255, 140, 140, 140),
                                                fontFamily: "Twitterchirp_bold",
                                                fontSize: 13.0,
                                                decoration: TextDecoration.none,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              labelText: "Time",
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                        SelectWhen(
                                            options: timeOptions,
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
                                final task = Habit(
                                  id: uuid.v1(),
                                  expirationDate: expirationDate,
                                  routineID: routine.authorID,
                                  isDone: false,
                                  scheduledFor: taskMoment.state.toLowerCase(),
                                  type: taskType.state,
                                  habitName: taskName.text,
                                  duration:
                                      "${taskDuration.text}-${taskTimeOption.state}",
                                );
                                context.read<CreateHabitBlocLogic>().add(
                                      CreateHabitAction(task: task),
                                    );
                                final tasks =
                                    context.read<TaskListCubit>().state;
                                tasks.add(task);
                                context
                                    .read<TaskListCubit>()
                                    .updateState(tasks);
                                setState(() {
                                  showCerateHabitPanel = !showCerateHabitPanel;
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
        ],
      ),
    );
  }
}
