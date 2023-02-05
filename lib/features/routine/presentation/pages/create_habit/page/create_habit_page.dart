import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/routine/domain/logic/input_validation.dart';
import 'package:habit_master/features/routine/infrastructure/models/habit_model.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/page/daily_routine_page.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/habit_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_logic/create_habit.dart';

import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/cubit/time_option_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/cubit/timer_task.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/cubit/type_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/cubit/when_cubit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/bloc/bloc/bloc_event/create_habit.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/widgets/v1/habit_options.dart';
import 'package:habit_master/features/routine/presentation/pages/create_habit/widgets/v1/select_when.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/tasks_list.dart';
import 'package:habit_master/shared/bloc/error_cubit.dart';
import 'package:habit_master/shared/bloc/show_error_cubit.dart';
import 'package:habit_master/shared/static/dates.dart';
import 'package:habit_master/shared/static/options.dart';
import 'package:habit_master/shared/widgets/error.dart';
import 'package:uuid/uuid.dart';

class CreateHabitPage extends StatefulWidget {
  const CreateHabitPage({Key? key}) : super(key: key);

  @override
  State<CreateHabitPage> createState() => _CreateHabitPageState();
}

class _CreateHabitPageState extends State<CreateHabitPage> {
  final TextEditingController taskName = TextEditingController();
  final TextEditingController taskDuration = TextEditingController();
  bool showError = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final canDisplayTimeTask = BlocProvider.of<TimerTaskCubit>(context);
    final taskType = BlocProvider.of<TypeTaskCubit>(context);
    final taskMoment = BlocProvider.of<MomentTaskCubit>(context);
    final taskTimeOption = BlocProvider.of<TimeOptionCubit>(context);
    final habit = context.read<HabitCubit>().state!;
    final showErrorPanel = BlocProvider.of<ShowErrorCubit>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 3, 15),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 3, 15),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: (height - 120),
                width: width,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 7, 3, 15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                            margin:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(0, 255, 255, 255),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              border: Border.all(
                                color: const Color.fromARGB(255, 119, 119, 119),
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
                                  color: Color.fromARGB(255, 140, 140, 140),
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
                          SelectWhen(options: momentOptions, title: "moment"),
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
                                    padding: const EdgeInsets.only(left: 10.0),
                                    height: 50,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          0, 255, 255, 255),
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
                                      options: timeOptions, title: "time"),
                                ],
                              ),
                            ));
                      },
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () async {
                          if (context.read<ErrorMessageCubit>().state.isEmpty ==
                              false) {
                            setState(() {
                              context.read<ShowErrorCubit>().updateState(true);
                            });
                          }
                          if ((taskType.state == typeOptions[1]) &&
                              (taskDuration.text.isEmpty)) {
                            context.read<ShowErrorCubit>().updateState(true);

                            context.read<ErrorMessageCubit>().updateState(
                                "Pleas set a duration for this habit");
                            return;
                          }
                          if (taskName.text.isEmpty == true) {
                            context.read<ShowErrorCubit>().updateState(true);

                            context
                                .read<ErrorMessageCubit>()
                                .updateState("The habit's name is required");
                            return;
                          }
                          const uuid = Uuid();
                          final task = Habit(
                            id: uuid.v1(),
                            expirationDate: expirationDate,
                            routineID: habit.authorID,
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
                          final tasks = context.read<TaskListCubit>().state;
                          tasks.add(task);
                          context.read<TaskListCubit>().updateState(tasks);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DailyRoutinePage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 50.0,
                          width: (200),
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 255, 243, 105)
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
                                color: const Color.fromARGB(255, 7, 3, 15),
                                fontFamily: "Twitterchirp_bold",
                                fontSize: 13.0,
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
    );
  }
}
