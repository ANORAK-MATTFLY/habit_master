import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/routine/presentation/states/cubit/timer_task.dart';
import 'package:habit_master/features/routine/presentation/widgets/daily_routine/habit_options.dart';
import 'package:habit_master/features/routine/presentation/widgets/daily_routine/select_when.dart';
import 'package:habit_master/shared/static/options.dart';

class HabitPanel extends StatefulWidget {
  const HabitPanel({Key? key}) : super(key: key);

  @override
  State<HabitPanel> createState() => _HabitPanelState();
}

class _HabitPanelState extends State<HabitPanel> {
  final TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final canDisplayTimeTask = BlocProvider.of<TimerTaskCubit>(context);
    return ListView(
      children: [
        Container(
          height: (height - 120.0),
          width: width - 100.0,
          decoration: const BoxDecoration(
            color: Color.fromARGB(232, 0, 0, 0),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
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
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                        controller: email,
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
                        validator: (emailValue) {},
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
                    habitOption("Meditate 🧘‍♂️"),
                    habitOption("Read a book📕"),
                    habitOption("Workout 👨‍💼"),
                    habitOption("Running 🏃‍♂️"),
                    habitOption("Writing ✍"),
                    habitOption("Walk my dog 🐩"),
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
                      "Repeat",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Twitterchirp",
                        fontSize: 15.0,
                        decoration: TextDecoration.none,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SelectWhen(options: frequencyOptions, title: "frequency"),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                color: const Color.fromARGB(0, 255, 255, 255),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 119, 119, 119),
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: TextFormField(
                                  cursorColor:
                                      const Color.fromARGB(255, 243, 176, 255),
                                  keyboardType: TextInputType.number,
                                  controller: email,
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
                                      color: Color.fromARGB(255, 140, 140, 140),
                                      fontFamily: "Twitterchirp_bold",
                                      fontSize: 13.0,
                                      decoration: TextDecoration.none,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    labelText: "Time",
                                    border: InputBorder.none,
                                  ),
                                  validator: (emailValue) {}),
                            ),
                            SelectWhen(options: timeOptions, title: "time"),
                          ],
                        ),
                      ));
                },
              ),
              Align(
                alignment: Alignment.center,
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
                        offset:
                            const Offset(2, 9), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "Create",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Twitterchirp_bold",
                        fontSize: 13.0,
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
      ],
    );
  }
}
